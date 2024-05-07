import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../app_constant/App_colors.dart';
class AddMealButton extends StatelessWidget {
  final Function() onTap;
   const AddMealButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 48,
        decoration:  const BoxDecoration(
          color: AppColors.primaryBlack,
          border: Border(
            left: BorderSide(color: AppColors.primaryColor,width: 5),
            bottom: BorderSide(color: AppColors.primaryColor,width: 5),
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(4),
            topLeft: Radius.circular(4),
          ),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
