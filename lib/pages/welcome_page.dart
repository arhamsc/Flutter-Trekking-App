//Custom carousel Slider
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_practice/cubit/app_cubits.dart';
import 'package:travel_app_practice/utils/colors.dart';
import 'package:travel_app_practice/widgets/app_large_text.dart';
import 'package:travel_app_practice/widgets/app_text.dart';
import 'package:travel_app_practice/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  List<String> text = [
    "Mountains",
    "Himalayas",
    "Lakes",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length, //as we use 3 images
        itemBuilder: (_, index) {
          //We want to slide the carousel up and down
          return Container(
            width: double.maxFinite, //takes max width for screen
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                //this is more or less a background image
                image: AssetImage("assets/images/${images[index]}"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(text: "Trips"),
                      AppText(
                          text: text[index], size: 30), //changes dynamically
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 250,
                        child: AppText(
                          text:
                              "Mountain hikes give you an incredible sense of freedom along with endurance tests.",
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context)
                              .getData(); //similar to provider package
                        },
                        child: SizedBox(
                          width: 200,
                          child: Row(
                            children: const [
                              ResponsiveButton(
                                width: 120,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
