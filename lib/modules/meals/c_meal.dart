import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meals_db/models/m_category.dart';
import 'package:meals_db/models/m_meal.dart';
import 'package:meals_db/services/api_end_point.dart';

class MealController extends GetxController {
  ValueNotifier<List<MealModel>> mealList = ValueNotifier([]);
  ValueNotifier<bool> xFetching = ValueNotifier(false);
  late CategoryModel data_;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> onInitLoad({required CategoryModel data}) async {
    data_ = data;
    await fetchMeal();
  }

  Future<void> fetchMeal() async {
    String url =
        ApiEndPoint().baseUrl + ApiEndPoint().getMeal + data_.categoryName;

    xFetching.value = true;
    GetConnect client = GetConnect(timeout: Duration(seconds: 10));
    Response response = await client.get(url);
    xFetching.value = false;
    if (response.isOk) {
      List<MealModel> temp = [];

      Iterable iterable = response.body["meals"] ?? [];
      for (var element in iterable) {
        MealModel data = MealModel.fromApi(data: element);
        temp.add(data);
      }
      mealList.value = temp;
    }
  }
}
