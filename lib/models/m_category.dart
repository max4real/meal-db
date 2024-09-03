

class CategoryModel {
  String categoryName;
  String? categoryImage;
  CategoryModel({required this.categoryName,  this.categoryImage});

  factory CategoryModel.fromApi({required Map<String, dynamic> data}) {
    String name = data["strCategory"] ?? -1;
    // String url = "https://www.themealdb.com/images/ingredients/"+name+".png";
    return CategoryModel(categoryName: name);
  }
}
///https://www.themealdb.com/images/ingredients/Chicken.png  --get category image by name
