import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_constant/App_colors.dart';
import '../../../shared_widgets/add_meal_dialogue.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: const Text(
              'Meals',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: false,
            actions: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset(
                      "assets/icons/menu.png",
                      scale: 4,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.5),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  controller.meals.length,
                      (mainIndex) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        controller.showDetails.value = !controller.showDetails.value;

                        controller.update();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 68,
                                        width: 68,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Image.asset(
                                          controller.meals[mainIndex].image,
                                          scale: 4,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        children: [
                                          Text(
                                            controller.meals[mainIndex].mealTitle,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          controller.meals[mainIndex].mealDataList!.isEmpty
                                              ? Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: const Color(0xFFA9A4A1),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                              child: Text(
                                                "No Products",
                                                style: TextStyle(fontSize: 9, color: Colors.white),
                                              ),
                                            ),
                                          )
                                              : controller.isEditModeList[mainIndex].value
                                              ? GestureDetector(
                                            onTap: () {
                                              controller.isEditingOrSaving(mainIndex);
                                              controller.update();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: AppColors.primaryGreen),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                                child: Text(
                                                  "Save",
                                                  style: TextStyle(fontSize: 10, color: AppColors.primaryGreen),
                                                ),
                                              ),
                                            ),
                                          )
                                              : Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller.isEditingOrSaving(mainIndex);
                                                  controller.update();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: Colors.black),
                                                  ),
                                                  child: const Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                                    child: Text(
                                                      "Edit",
                                                      style: TextStyle(fontSize: 10),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Image.asset("assets/icons/save.png", scale: 4),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: Get.context!,
                                      builder: (BuildContext context) {
                                        return AddMealDialog(
                                          onAddMeal: (name, calories) {
                                            controller.addMeal(mainIndex, name, calories);
                                            controller.update();
                                          },
                                        );
                                      },
                                    );
                                  },

                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primaryBlack,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(4),
                                        bottomLeft: Radius.circular(4),
                                        topLeft: Radius.circular(4),
                                      ),
                                    ),
                                    child: const Icon(Icons.add, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            controller.meals[mainIndex].mealDataList!.isNotEmpty
                                ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                        topLeft: Radius.circular(2),
                                        topRight: Radius.circular(2),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: controller.meals[mainIndex].mealDataList?.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return buildMealListItem(mainIndex, index);
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildMealListItem(int mainIndex, int index) {
    final mealDataList = controller.meals[mainIndex].mealDataList!;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  mealDataList[index]["name"],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(color: AppColors.greyColor, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(mealDataList[index]["calories"], style: const TextStyle(color: AppColors.blackText)),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        controller.isEditModeList[mainIndex].value ? controller.deleteMeal(mainIndex, index) : null;
                        controller.update();

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.isEditModeList[mainIndex].value ? const Color(0xFFE68B85) : AppColors.nextContainer,
                        ),
                        child: Icon(
                          controller.isEditModeList[mainIndex].value ? Icons.cancel : Icons.arrow_forward,
                          color: AppColors.primaryColor,
                          size: 17,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        index == mealDataList.length - 1
            ? Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(color: Colors.white, height: 3),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total", style: TextStyle(color: AppColors.primaryGreen, fontSize: 16)),
                  Row(
                    children: [
                      Text('${controller.totalCaloriesList[mainIndex]}', style: const TextStyle(color: AppColors.primaryGreen)),
                      const SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
            : const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Colors.white, height: 3),
        ),
      ],
    );
  }

}



