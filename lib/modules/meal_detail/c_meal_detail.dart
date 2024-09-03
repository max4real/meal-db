import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meals_db/models/m_meal.dart';
import 'package:meals_db/models/m_meal_detail.dart';
import 'package:meals_db/services/api_end_point.dart';

class MealDetailController extends GetxController {
  late MealDetailModel detailModel; /////here
  late MealModel data_;
  ValueNotifier<bool> xFetching = ValueNotifier(false);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onInitLoad({required MealModel data}) async {
    data_ = data;
    await fetchDetail();
  }

  Future<void> fetchDetail() async {
    String url = ApiEndPoint().baseUrl +
        ApiEndPoint().getMealDetails +
        data_.mealId.toString();

    xFetching.value = true;
    GetConnect client = GetConnect(timeout: const Duration(seconds: 10));
    final response = await client.get(url);

    if (response.isOk) {
      Iterable iterable = response.body["meals"] ?? [];
      Map<String, dynamic> rawData = iterable.firstOrNull ?? {};
      detailModel = MealDetailModel.fromApi(data: rawData);
      xFetching.value = false;
    }
  }
}