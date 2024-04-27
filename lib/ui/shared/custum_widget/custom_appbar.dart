import 'package:darrebni/ui/shared/colors.dart';
import 'package:darrebni/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.icon});
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHieght(90), horizontal: screenWidth(90)),
      child: Container(
        width: screenWidth(8),
        height: screenHieght(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.greytextColor,
        ),
        child: IconButton(
          color: AppColors.mainBlueColor,
          icon: icon,
          onPressed: () {},
        ),
      ),
    );
  }
}
