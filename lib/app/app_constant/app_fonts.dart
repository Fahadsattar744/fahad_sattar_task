import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'App_colors.dart';

class AppFonts {
  static const String helveticaBold = "Helvetica";

  static const String helveticaRegular = "Helvetica-regular";
}

class AppTextStyle {
  static TextStyle get helveticaLight => TextStyle(
      fontFamily: AppFonts.helveticaRegular,
      fontSize: 11.sp,
      color: AppColors.greyColor,
      fontWeight: FontWeight.w300);

  static TextStyle get helveticaRegular => TextStyle(
        fontFamily: AppFonts.helveticaRegular,
        fontSize: 11.sp,
        color: AppColors.kWhite,
      );
}
