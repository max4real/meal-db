import 'package:flutter/material.dart';
import 'package:meals_db/models/m_category.dart';
import 'package:meals_db/modules/meal_detail/v_meal_detail.dart';
import 'package:meals_db/modules/meals/c_meal.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MealPage extends StatelessWidget {
  late CategoryModel inData;
  MealPage({super.key, required this.inData});
  @override
  Widget build(BuildContext context) {
    MealController controller = Get.put(MealController());
    controller.onInitLoad(data: inData);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(inData.categoryName),
        ),
        body: ValueListenableBuilder(
          valueListenable: controller.xFetching,
          builder: (context, value, child) {
            if (value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 148, 135, 246),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  controller.fetchMeal();
                },
                child: ValueListenableBuilder(
                  valueListenable: controller.mealList,
                  builder: (context, value, child) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 4 / 5),
                      itemCount: value.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final each = value[index];
                        return GestureDetector(
                          onTap: () {

                            Get.to(()=>MealDetailPage(data_: each));
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 108, 118, 228)
                                .withOpacity(1),

                            child: Column(
                              children: [
                                Expanded(
                                  child: Hero(
                                    tag: each.mealImage,
                                    child: Image.network(
                                      each.mealImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      // borderRadius: BorderRadius.circular(5)
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.5, vertical: 4),
                                    child: Text(
                                      each.mealName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            }
          },
        ));
  }
}
