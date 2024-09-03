import 'package:flutter/material.dart';
import 'package:meals_db/modules/category/c_category.dart';
import 'package:get/get.dart';
import 'package:meals_db/modules/meals/v_meal_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController controller = Get.put(CategoryController());
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Category"),
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
                  controller.fetchCategory();
                },
                child: ValueListenableBuilder(
                  valueListenable: controller.allCaegory,
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
                            Get.to(() =>
                                // MealPage(name_: each.ingredientName)
                                MealPage(inData: each)
                                );
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 108, 118, 228).withOpacity(1),
                            // color: const Color.fromARGB(255, 223, 225, 230)
                            //     .withOpacity(1),

                            // const Color.fromARGB(255, 148, 135, 246) .withOpacity(1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Center(
                                //   child: Image.network(
                                //     each.categoryImage,
                                //     fit: BoxFit.cover,
                                //   ),
                                // ),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                                255, 18, 16, 54),
                                        borderRadius: BorderRadius.circular(5)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 3),
                                    child: Text(
                                      each.categoryName,
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
