import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'App_colors.dart';

class AppFonts {
  static const String poppinsBold = "Poppins-Bold";
  static const String poppinsRegular = "Poppins-Regular";
  static const String poppinsLight = "Poppins-Light";
  static const String poppinsMedium = "Poppins-Medium";
  static const String poppinsSemiBold = "Poppins-SemiBold";
}

class AppTextStyle {
  static TextStyle get poppinsLight => TextStyle(
      fontFamily: AppFonts.poppinsLight,
      fontSize: 11.sp,
      color: AppColors.greyColor,
      fontWeight: FontWeight.w300);

  static TextStyle get poppinsMedium => TextStyle(
        fontFamily: AppFonts.poppinsMedium,
        fontSize: 11.sp,
        color: AppColors.kWhite,
      );
  static TextStyle get poppinsBold => TextStyle(
        fontFamily: AppFonts.poppinsBold,
        fontSize: 11.sp,
        color: AppColors.kWhite,
      );
  static TextStyle get poppinsRegular => TextStyle(
        fontFamily: AppFonts.poppinsRegular,
        fontSize: 11.sp,
        color: AppColors.kWhite,
      );
  static TextStyle get poppinsSemiBold => TextStyle(
        fontFamily: AppFonts.poppinsSemiBold,
        fontSize: 11.sp,
        color: AppColors.kWhite,
      );
}
