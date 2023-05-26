class Meals {
  String? idMeal;
  String? strMeal;
  String? strMealThumb;

  Meals({
    this.idMeal,
    this.strMeal,
    this.strMealThumb,
  });

  factory Meals.fromJson(dynamic json) {
    return Meals(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
    );
  }

  static List<Meals> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Meals.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Categories {idCategory: $idMeal, strCategory: $strMeal, strCategoryThumb: $strMealThumb}';
  }
}
