import 'package:flutter/material.dart';

import '../../../../app_constant/App_colors.dart';
class SubListWidget extends StatelessWidget {
  final Widget child;
  const SubListWidget({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
      ),
      child: Column(
        children: [
          child
        ],
      ),
    );
  }
}
