import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_constant/global_var.dart';
import '../../../app_constant/local_keys.dart';




class LocalDB extends GetxService {
  late SharedPreferences pref;
  @override
  void onInit() async {
    pref = await SharedPreferences.getInstance();
    Get.log("LocalDB Controller init called : Service Started");
    Globals.authToken = pref.getString(LocalDataKey.authToken.name) ?? "";
    super.onInit();
  }

  static Future setData(String key, value) async {
    SharedPreferences pref = Get.find<LocalDB>().pref;
    switch (value.runtimeType) {
    // ignore: type_literal_in_constant_pattern
      case int:
        await pref.setInt(key, value);
        break;
    // ignore: type_literal_in_constant_pattern
      case String:
        await  pref.setString(key, value);
        break;
    // ignore: type_literal_in_constant_pattern
      case bool:
        await pref.setBool(key, value);
        break;
    // ignore: type_literal_in_constant_pattern
      case double:
        await pref.setDouble(key, value);
        break;
    // ignore: type_literal_in_constant_pattern
      case  const (List<String>):
        await pref.setStringList(key, value);
        break;
    }
  }

  static dynamic getData(String key, {type}) async {
    SharedPreferences pref = await SharedPreferences.getInstance() ;
    if (type != null) {
      return pref.getStringList(key);
    }
    return pref.get(key);
  }

  static void clear() async {
    SharedPreferences pref = Get.find<LocalDB>().pref;
    Globals.authToken = "";
    pref.remove(Globals.authToken);
    await pref.clear();
  }
}
