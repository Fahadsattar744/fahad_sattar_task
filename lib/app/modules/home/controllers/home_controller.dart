import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/meals.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    isEditModeList = List.generate(meals.length, (index) => false.obs);
    totalCaloriesList = List.generate(meals.length, (_) => 0.0.obs);
  }

  Rx<bool> showDetails = true.obs;
  List<RxBool> isEditModeList = [];

  void showAddMealDialog(int mainIndex) {
    String name = '';
    String calories = '';

    Get.defaultDialog(
      title: 'Add Meal',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              name = value;
            },
            decoration: InputDecoration(labelText: 'Meal Name'),
          ),
          TextField(
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              calories = value;
            },
            decoration: InputDecoration(labelText: 'Calories'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            addMeal(mainIndex, name, calories);
            Get.back();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
  void isEditingOrSaving(int index) {
    isEditModeList[index].value = !isEditModeList[index].value;
    update();
  }


  List<MealsModel> meals = [
    MealsModel(
      mealTitle: 'Meal One',
      mealDataList: [],
      image: 'assets/icons/meal_1.png',
    ),
    MealsModel(
      mealTitle: 'Meal Two',
      mealDataList: [],
      image: 'assets/icons/copy.png',
    ),
    MealsModel(
      mealTitle: 'Meal Three',
      mealDataList: [],
      image: 'assets/icons/sun.png',
    ),
    MealsModel(
      mealTitle: 'Meal Four',
      mealDataList: [],
      image: 'assets/icons/sun-fog.png',
    ),
    MealsModel(
      mealTitle: 'Meal Five',
      mealDataList: [],
      image: 'assets/icons/moon.png',
    ),
    MealsModel(
      mealTitle: 'Meal Six',
      mealDataList: [],
      image: 'assets/icons/meal_six.png',
    ),
  ];


  List<Map<String, dynamic>> mealDataList = [];
  List<Rx<double>> totalCaloriesList = [];
  void calculateTotalCalories(int mealIndex) {
    double total = 0;
    for (var mealData in meals[mealIndex].mealDataList!) {
      total += double.parse(mealData["calories"].split(" ")[0]);
    }
    totalCaloriesList[mealIndex].value = total;
  }


  void addMeal(int mealIndex, String name, String calories) {
    meals[mealIndex].mealDataList?.add({"name": name, "calories": calories});
    calculateTotalCalories(mealIndex);
  }

  void deleteMeal(int mealIndex, int dataIndex) {
    meals[mealIndex].mealDataList?.removeAt(dataIndex);
    calculateTotalCalories(mealIndex);
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
