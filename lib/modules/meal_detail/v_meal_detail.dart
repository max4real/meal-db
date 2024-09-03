import 'package:flutter/material.dart';
import 'package:meals_db/models/m_meal.dart';
import 'package:meals_db/modules/meal_detail/c_meal_detail.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MealDetailPage extends StatelessWidget {
  MealModel data_;
   MealDetailPage({super.key,required this.data_});

  @override
  Widget build(BuildContext context) {
    MealDetailController controller =Get.put(MealDetailController());
    controller.onInitLoad(data: data_);
    return Scaffold(
        appBar: AppBar(
          title: Text(data_.mealName),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Hero(
                      tag: data_.mealImage,
                      child: Image.network(
                        data_.mealImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.xFetching,
                builder: (context, value, child) {
                  if (value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: [
                      
                        SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: controller.detailModel.recipe
                                  .map((toElement) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        child: Image.network(toElement
                                            .ingredient.image),
                                      ),
                                      SizedBox(
                                          height: 40,
                                          child: Column(
                                            children: [
                                              Text(
                                                toElement
                                                    .ingredient.ingredientName,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                toElement.measurement
                                                    .toString()
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: Colors.black),
                            child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Instruction",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          controller.detailModel.instruction 
                                             ,
                                          style: const TextStyle(
                                              color: Colors.white, fontSize: 13),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}