import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'App_colors.dart';

class Utils {
  static String getImagePath(String name, {String format= 'png'}) {
    return 'assets/images/$name.$format';
  }
  static String getIconPath(String name, {String format= 'png'}) {
    return 'assets/icons/$name.$format';
  }
  static String getIconBarPath(String name, {String format= 'png'}) {
    return 'assets/icons/bar/$name.$format';
  }
  static String getIconAccountPath(String name, {String format= 'png'}) {
    return 'assets/icons/account/$name.$format';
  }
  static String getSvgPath(String name, {String format= 'svg'}) {
    return 'assets/svgs/$name.$format';
  }
  static showToast({ required String message,int time=2}) {
    Fluttertoast.showToast(
        msg: message,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.tayriYellow,
        textColor: Colors.black,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);
  }


}