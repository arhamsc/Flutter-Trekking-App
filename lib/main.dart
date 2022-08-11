import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_practice/cubit/app_cubit_logic.dart';
import 'package:travel_app_practice/cubit/app_cubits.dart';
import 'package:travel_app_practice/pages/detail_page.dart';
import 'package:travel_app_practice/pages/main_page.dart';
import 'package:travel_app_practice/pages/welcome_page.dart';
import 'package:travel_app_practice/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(data: DataServices()),
        child: AppCubitLogics(), //child can access all these cubits/states
      ),
    );
  }
}