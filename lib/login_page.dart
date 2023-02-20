// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, annotate_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
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
    return Scaffold(
        backgroundColor: Colors.grey[0],
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //Welcome Again
              Text(
                'Welcome Again',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
              ),

              SizedBox(height: 20),

              //You have been missed
              Text(
                'You have Been Missed!!!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),

              SizedBox(height: 20),

              //UserName
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// username or Gmail
                      TextFormField(
                        //style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Enter Your Username',
                          labelText: "Usename",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        controller: _userNameController,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          } else if (value.length < 4) {
                            return 'at least enter 4 characters';
                          } else if (value.length > 13) {
                            return 'maximum character is 13';
                          }
                          return null;
                        },
                      ),
                      //
                      //
                      //
                      SizedBox(height: 15),
                      //
                      //
                      //Password
                      TextFormField(
                        //style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Enter Your Password',
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        controller: _passwordController,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          } else if (value.length < 4) {
                            return 'at least enter 4 characters';
                          } else if (value.length > 13) {
                            return 'maximum character is 20';
                          }
                          return null;
                        },
                      ),
                      //
                      //
                      SizedBox(height: 20),
                      //
                      //signIn
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: signIn,
                          onDoubleTap: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // ... Navigate To your Home Page
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Text(
                                  'Sign IN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        )));
  }
}
