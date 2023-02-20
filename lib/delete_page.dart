// ignore: file_names
// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, sort_child_properties_last, camel_case_types, file_names, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/home_page.dart';

// import 'package:firebase_auth/firebase_auth.daissuePage

class deletePage extends StatefulWidget {
  const deletePage({Key? key}) : super(key: key);
  @override
  _deletePageState createState() => _deletePageState();
}

class _deletePageState extends State<deletePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _bookName = TextEditingController();
    final _copiesController = TextEditingController();
    // debugShowCheckedModeBanner: false,
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Book'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 41, 184, 227),
              Color.fromARGB(255, 41, 184, 227)
            ])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              //
              //
              SizedBox(height: 140),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: RichText(
                    text: TextSpan(
                      text: ' BookName: ',
                      style: kLoginSub2TitleStyle(size),
                      children: [
                        TextSpan(
                          //text: note.Bookname,
                          style: kLoginTermsAndPrivacyStyle(size),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //
              //
              //
              SizedBox(height: 10),
              //
              //
              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.label,
                          color: Colors.blue,
                        ),
                        labelText: 'Total Copies',
                        hintText: 'Total Copies To be Deleted',
                      ),
                      onChanged: (String value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'Please Enter Book Name' : null;
                      },
                    ),
                  ),
                ),
              ),

              //
              //
              //
              SizedBox(height: 30),
              //
              //
              //
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      elevation: 5.0,
                      color: Colors.blue,
                      padding: EdgeInsets.all(13.0),
                      child: Text("Cancel",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => homePage()),
                        );
                      },
                    ),

                    //Issue Button
                    MaterialButton(
                      elevation: 5.0,
                      color: Colors.blue,
                      padding: EdgeInsets.all(13.0),
                      child: Text("Delete",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
