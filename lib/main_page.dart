// ignore_for_file: unused_import, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/SignInOne.dart';
import 'package:flutter_application_1/add_Book.dart';
import 'package:flutter_application_1/detail_screen.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/issue_Page.dart';
import 'package:flutter_application_1/home_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return homePage();
        } else {
          return homePage();

          // return mainAnimation();
        }
      },
    ));
  }
}
