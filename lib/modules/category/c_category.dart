import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meals_db/models/m_category.dart';
import 'package:meals_db/services/api_end_point.dart';

class CategoryController extends GetxController {
  ValueNotifier<bool> xFetching = ValueNotifier(false);
  ValueNotifier<List<CategoryModel>> allCaegory = ValueNotifier([]);
  String url = ApiEndPoint().baseUrl + ApiEndPoint().getAllCategory;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onInitLoad();
  }

  Future<void> onInitLoad() async {
    fetchCategory();
  }

  Future<void> fetchCategory() async {
    xFetching.value = true;
    GetConnect client = GetConnect(timeout: Duration(seconds: 10));
    Response response = await client.get(url);
    xFetching.value = false;

    if (response.isOk) {
      Iterable iterable = response.body["meals"] ?? [];
      List<CategoryModel> temp = [];

      for (var element in iterable) {
        CategoryModel data = CategoryModel.fromApi(data: element);
        temp.add(data);
      }
      allCaegory.value = temp;
    }
  }
}
