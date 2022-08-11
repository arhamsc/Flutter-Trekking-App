import 'package:flutter/material.dart';

import 'package:travel_app_practice/utils/colors.dart';
import 'package:travel_app_practice/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final String? text;
  final IconData? icon;
  final bool? isIcon;

  const AppButtons({
    Key? key,
    this.isIcon = false,
    this.text = "Hi",
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Center(
        child: isIcon == false
            ? AppText(
                text: text!,
                color: color,
              )
            : Icon(
                icon,
                color: color,
              ),
      ),
    );
  }
}
