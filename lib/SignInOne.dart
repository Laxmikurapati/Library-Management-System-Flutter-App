// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:lottie/lottie.dart';

class SignInOne extends StatefulWidget {
  const SignInOne({Key? key}) : super(key: key);

  @override
  State<SignInOne> createState() => _SignInOneState();
}

class _SignInOneState extends State<SignInOne> {
  //controller
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //signIn Function
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _userNameController.text.trim(),
        password: _passwordController.text.trim());
  }

  //cleanup of the derived class
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromARGB(255, 41, 184, 227), Colors.white38])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 120,
                  width: 210,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF7ADDFC), Color(0xFF48C8C6)]),
                      //color: Color(0xFFB8FFF9),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(14, 7),
                            blurRadius: 4,
                            spreadRadius: 3,
                            color: Colors.black12)
                      ],
                      borderRadius: BorderRadius.circular(200).copyWith(
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'L',
                        style: TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 77, 137),
                            shadows: [
                              Shadow(
                                  color: Color(0xFF67A5C2),
                                  offset: Offset(1, 1),
                                  blurRadius: 5)
                            ]),
                      ),
                      Text(
                        'ibrary',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 77, 137),
                            shadows: [
                              Shadow(
                                  color: Colors.black45,
                                  offset: Offset(1, 1),
                                  blurRadius: 5)
                            ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //
                //
                //
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 250,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF7ADDFC), Color(0xFF48C8C6)]),
                      boxShadow: [
                        BoxShadow(
                            // blurRadius: 4,
                            // spreadRadius: 3,
                            // offset: Offset(16, 8),
                            // color: Colors.black12
                            )
                      ],
                      border: Border.all(
                          width: 1, color: Colors.lightBlue.shade200),

                      //border: Border.all(width: 5, color: Color(0xFFEFFFFD)),
                      borderRadius: BorderRadius.circular(100).copyWith(
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(0))),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //
                        //
                        //
                        //
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30)
                              .copyWith(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 252, 252),
                              borderRadius: BorderRadius.circular(30).copyWith(
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(0)),
                            ),
                            child: TextFormField(
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5),

                              decoration: InputDecoration(
                                  prefixIconConstraints:
                                      BoxConstraints(minWidth: 45),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.lightBlue,
                                    size: 22,
                                  ),
                                  border: InputBorder.none,
                                  hintText: '             Enter Email',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue,
                                      fontSize: 16),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)
                                          .copyWith(
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(0)),
                                      borderSide:
                                          BorderSide(color: Colors.white38)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)
                                          .copyWith(
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(0)),
                                      borderSide:
                                          BorderSide(color: Colors.white70))),
                              controller: _userNameController,
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter username';
                                } else if (value.length < 4) {
                                  return 'at least enter 4 characters';
                                } else if (value.length > 20) {
                                  return 'maximum character is 18';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        //
                        //
                        //
                        //
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30)
                              .copyWith(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 252, 252),
                              borderRadius: BorderRadius.circular(30).copyWith(
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(0)),
                            ),
                            child: TextFormField(
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5),
                              decoration: InputDecoration(
                                  prefixIconConstraints:
                                      BoxConstraints(minWidth: 45),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.lightBlue,
                                    size: 22,
                                  ),
                                  border: InputBorder.none,
                                  hintText: '              Enter Password',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue,
                                      fontSize: 16),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)
                                          .copyWith(
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(0)),
                                      borderSide:
                                          BorderSide(color: Colors.white38)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)
                                          .copyWith(
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(0)),
                                      borderSide:
                                          BorderSide(color: Colors.white70))),
                              controller: _passwordController,
// The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                } else if (value.length < 4) {
                                  return 'at least enter 4 characters';
                                } else if (value.length > 20) {
                                  return 'maximum character is 18';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Text(' ',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 13)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //
                //
                //
                //

                GestureDetector(
                  onTap: signIn,
                  onDoubleTap: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // ... Navigate To your Home Page
                    }
                  },
                  child: Container(
                    height: 57,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 9,
                            color: Colors.black12.withOpacity(.2),
                            offset: Offset(10, 5))
                      ],
                      borderRadius: BorderRadius.circular(30).copyWith(
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(0)),
                      color: Colors.blue,
                    ),
                    child: Text('Login',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 19,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                //
                //
                ///
                ///waste
                ///below
                ///
                SizedBox(
                  height: 50,
                ),
                Text(' ',
                    style: TextStyle(color: Colors.white70, fontSize: 13)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 53,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.white60),
                    borderRadius: BorderRadius.circular(30).copyWith(
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(0)),
                  ),
                  child: Text(' ',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
