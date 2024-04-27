import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:darrebni/ui/shared/colors.dart';

class CustumButton extends StatelessWidget {
  const CustumButton({
    Key? key,
    required this.text,
    this.textColor = const Color.fromRGBO(252, 252, 252, 1),
    this.backgroundColor = const Color.fromRGBO(50, 141, 196, 1),
    this.borderColor,
    this.onPressed,
    this.imageName,
  }) : super(key: key);

  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Function? onPressed;
  final String? imageName;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) onPressed!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imageName != null) ...[
            SvgPicture.asset('images/$imageName'),
            SizedBox(
              width: size.width * 0.05,
            )
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: backgroundColor ?? AppColors.blacktextColor,
        fixedSize: Size(size.height / 2.03, size.height / 11),
        side: borderColor != null
            ? BorderSide(
                width: 1.0,
                color: borderColor!,
              )
            : null,
      ),
    );
  }
}
