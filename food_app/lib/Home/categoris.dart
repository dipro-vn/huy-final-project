class Categories {
  String? idMeal;
  String? strMeal;
  String? strMealThumb;

  Categories({
    this.idMeal,
    this.strMeal,
    this.strMealThumb,
  });

  factory Categories.fromJson(dynamic json) {
    return Categories(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
    );
  }

  static List<Categories> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Categories.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Categories {idCategory: $idMeal, strCategory: $strMeal, strCategoryThumb: $strMealThumb}';
  }
}
