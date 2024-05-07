import 'package:fahad_sattar_task/app/app_constant/App_colors.dart';
import 'package:fahad_sattar_task/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MealSubList extends GetView<HomeController> {
  final int mainIndex,index;
   const MealSubList({super.key, required this.mainIndex,required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  controller.meals[mainIndex].mealDataList![index]["name"],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(color: AppColors.greyColor, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(controller.meals[mainIndex].mealDataList![index]["calories"] + " Cals", style: const TextStyle(color: AppColors.blackText,fontWeight: FontWeight.bold)),
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
        index == controller.meals[mainIndex].mealDataList!.length - 1
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
                      Text('${controller.totalCaloriesList[mainIndex]} Cals', style: const TextStyle(color: AppColors.primaryGreen)),
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
