import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quote_app/screens/login.dart';
import 'package:my_quote_app/screens/profile.dart';
import 'package:my_quote_app/utils/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


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

      home: LoginPage(),

    );
  }
}


