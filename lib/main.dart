import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quote_app/screens/home_page.dart';
import 'package:my_quote_app/screens/profile.dart';
import 'package:my_quote_app/utils/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: primaryColor,
      ),
      home: HomePage(),
    );
  }
}


