//should hold states and check for states.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_practice/cubit/app_cubit_states.dart';
import 'package:travel_app_practice/cubit/app_cubits.dart';
import 'package:travel_app_practice/pages/detail_page.dart';
import 'package:travel_app_practice/pages/main_page.dart';
import 'package:travel_app_practice/pages/nav_pages/home_page.dart';
import 'package:travel_app_practice/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage(); //this is our class.
          } else if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            return const MainPage();
          } else if (state is DetailState) {
            return DetailPage();
          } else {
            return Container();
          }
        },
      ),
    ); //BlocBuilder will check the states.
  }
}
