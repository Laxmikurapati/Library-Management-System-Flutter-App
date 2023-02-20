// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:flutter_application_1/main_Animation.dart';
//import 'package:flutter_application_1/main_page.dart';
// import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/SignInOne.dart';
import 'package:flutter_application_1/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
