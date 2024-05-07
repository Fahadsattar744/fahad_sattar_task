import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'app/data/provider/local_storage/local_db.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LocalDB());
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return DevicePreview(
        enabled: false,
        builder: (context) =>GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
      debugShowCheckedModeBanner: false,
      title: "Fahad Sattar's Test",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ));
  }));
}
