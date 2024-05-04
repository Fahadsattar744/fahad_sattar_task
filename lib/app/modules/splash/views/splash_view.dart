import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SplashController>(
      init: SplashController(),
      builder: (context) {
        return  Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Center(
                child: const Text(
                  "Fahad Sattar's Task",
                  style: TextStyle(fontSize: 20),
                ).paddingOnly(bottom: 20),
              ),
           //   Center(child: const CircularProgressIndicator())
            ],
          ),
        );
      }
    );
  }
}
