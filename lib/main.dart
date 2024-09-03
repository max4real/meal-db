import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meals_db/modules/category/v_category_page.dart';

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: false
    ),
    home: CategoryPage() ,
  ));
}