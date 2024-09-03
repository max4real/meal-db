class MealModel {
  int mealId;
  String mealName;
  String mealImage;
  MealModel(
      {required this.mealId, required this.mealName, required this.mealImage});
      
  factory MealModel.fromApi({required Map<String, dynamic> data}) {
    int id = int.tryParse(data["idMeal"].toString()) ?? -1;
    return MealModel(
        mealId: id,
        mealName: data["strMeal"] ?? -1,
        mealImage: data["strMealThumb"] ?? -1);
  }
}
