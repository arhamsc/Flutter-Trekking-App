import 'package:flutter/material.dart';
import 'package:travel_app_practice/utils/colors.dart';
import 'package:travel_app_practice/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final String? text;

  const ResponsiveButton(
      {Key? key, this.isResponsive = false, this.width, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            isResponsive != null && isResponsive! && text != null
                ? AppText(
                    text: text!,
                    color: Colors.white,
                  )
                : const SizedBox(),
            Image.asset("assets/images/button-one.png"),
          ],
        ),
      ),
    );
  }
}
