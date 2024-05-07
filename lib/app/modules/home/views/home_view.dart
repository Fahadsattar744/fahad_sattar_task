import 'package:fahad_sattar_task/app/modules/home/views/component/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_constant/App_colors.dart';
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
                    child: ListTileData(mainIndex:mainIndex),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



