import 'package:fahad_sattar_task/app/app_constant/App_colors.dart';
import 'package:fahad_sattar_task/app/modules/home/controllers/home_controller.dart';
import 'package:fahad_sattar_task/app/modules/home/views/component/add_button.dart';
import 'package:fahad_sattar_task/app/modules/home/views/component/sublist_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared_widgets/add_meal_dialogue.dart';
import 'edit_save_button.dart';
import 'meal_sub_list.dart';

class ListTileData extends GetView<HomeController> {
  final int mainIndex;

  const ListTileData({super.key, required this.mainIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),
                          ),
                          controller.meals[mainIndex].mealDataList!.isEmpty
                              ? Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFFA9A4A1),),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                    child: Text(
                                      "No Products",
                                      style: TextStyle(fontSize: 9, color: Colors.white),
                                    ),
                                  ),
                                )
                              : controller.isEditModeList[mainIndex].value
                                  ? EditSaveButton(
                                      onTap: () {
                                        controller.isEditingOrSaving(mainIndex);
                                        controller.update();
                                      },
                                      title: "Save",
                                      clr: AppColors.primaryGreen,
                                    )
                                  : Row(
                                      children: [
                                        EditSaveButton(
                                          onTap: () {
                                            controller.isEditingOrSaving(mainIndex);
                                            controller.update();
                                          },
                                          title: "Edit",
                                        ),
                                        const SizedBox(width: 4),
                                        Image.asset("assets/icons/save.png",
                                            scale: 4),
                                      ],
                                    )
                        ],
                      )
                    ],
                  ),
                ),
                AddMealButton(
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
                )
              ],
            ),
            controller.meals[mainIndex].mealDataList!.isNotEmpty
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SubListWidget(
                            child: Column(
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.meals[mainIndex].mealDataList?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return MealSubList(
                                    mainIndex: mainIndex, index: index);
                              },
                            ),
                          ],
                        )),
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
