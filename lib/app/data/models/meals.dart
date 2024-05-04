class MealsModel {
  String image;
  String mealTitle;
  final List<Map<String, dynamic>>? mealDataList;


  MealsModel({
    required this.image,
    required this.mealTitle,
     this.mealDataList,
  });
}

