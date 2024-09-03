class ApiEndPoint {
  String baseUrl="https://www.themealdb.com/api/json/v1/1";
  String baseUrlImage="https://www.themealdb.com/images";
  
  String getAllCategory ="/list.php?c=list";
  String getMeal ="/filter.php?c="; //add name
  String getMealDetails="/lookup.php?i="; //add ID

}

///https://www.themealdb.com/api/json/v1/1/list.php?c=list  --get category
///https://www.themealdb.com/api/json/v1/1/filter.php?c=Chicken  -- get meal by category
///https://www.themealdb.com/api/json/v1/1/lookup.php?i=53050 --get meal detail by meal ID
///
///
///https://www.themealdb.com/images/ingredients/Beef.png  --get category image by name
///https://www.themealdb.com/images/media/meals/020z181619788503.jpg  --get meal image