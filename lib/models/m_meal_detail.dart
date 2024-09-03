import 'package:meals_db/models/m_meal.dart';

class MealDetailModel extends MealModel {
  String area;
  String instruction;
  List<Recipe> recipe;

  MealDetailModel({
    required super.mealId,
    required super.mealName,
    required super.mealImage,
    required this.area,
    required this.instruction,
    required this.recipe,
  });

  factory MealDetailModel.fromApi({required Map<String, dynamic> data}) {
    int id = int.tryParse(data["idMeal"].toString()) ?? -1;
    List<Recipe> temp = [];

    print(id);

    for (var i = 1; i <= 20; i++) {
      String? strIngredient = data["strIngredient$i"];
      String? strMeasure = data["strMeasure$i"];

      if (strIngredient == "") {
        print("break");
        break;
      } else {
        print(i);

        Ingredient ingredientModel_ = Ingredient.fromApi(data: {
          "strIngredient1": strIngredient,
          "strImage":
              "https://www.themealdb.com/images/ingredients/$strIngredient-Small.png"

        });
        Recipe temp__ =
            Recipe(ingredient: ingredientModel_, measurement: strMeasure);
        temp.add(temp__);
      }
    }


    return MealDetailModel(
        mealId: id,
        mealName: data["strMeal"].toString(),
        mealImage: data["strMealThumb"].toString(),
        area: data["strArea"].toString(),
        instruction: data["strInstructions"].toString(),
        recipe: temp);
  }
}

class Ingredient {
  String ingredientName;
  String image;
  Ingredient({required this.ingredientName, required this.image});
  factory Ingredient.fromApi({required Map<String, dynamic> data}) {
    return Ingredient(
        ingredientName: data["strIngredient1"].toString(),
        image: data["strImage"].toString());
  }
}

class Recipe {
  Ingredient ingredient;
  String? measurement;
  Recipe({required this.ingredient, required this.measurement});
}
