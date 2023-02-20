// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, unused_import, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, no_logic_in_create_state
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/delete_page.dart';
import 'package:flutter_application_1/issue_Page.dart';
import 'package:flutter_application_1/update_page.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: unused_import
// import 'note.dart';
// import 'dart:html';

class DetailScreen extends StatefulWidget {
  // final Note note;
  String name;
  DetailScreen(this.name, {super.key});

  @override
  _DetailScreenState createState() => _DetailScreenState(name: name);
}

class _DetailScreenState extends State<DetailScreen> {
  String name;
  List resultFromNoOfCopies = [];
  List resultFromBooks = [];

  void searchFromFirebase() async {
    final searchFromNoOfCopies = await FirebaseFirestore.instance
        .collection("NoOfCopies")
        .where("BookName", isEqualTo: name)
        .get();

    final searchFromBooks = await FirebaseFirestore.instance
        .collection("Books")
        .where("BookName", isEqualTo: name)
        .get();

    setState(() {
      resultFromNoOfCopies = searchFromNoOfCopies.docs.toList();
      resultFromBooks = searchFromBooks.docs.toList();
      print(searchFromNoOfCopies.docs.toList());
    });
  }

  _DetailScreenState({required this.name});

  String nameToUpdatePage = "";

  @override
  Widget build(BuildContext context) {
    searchFromFirebase();
    var size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //255, 81, 202, 101
        //83, 178, 66, 1
        // 255, 119, 214, 127
        //255, 4, 167, 69
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 124, 222, 105),
        foregroundColor: Colors.white,
        title: const Text("Book Details",
            style: TextStyle(
                color: Color.fromARGB(240, 245, 241, 241),
                fontStyle: FontStyle.normal,
                fontSize: 30)),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Color.fromARGB(255, 244, 246, 246),
        //       Color.fromARGB(255, 250, 250, 250)
        //     ],
        //   ),
        // ),
        margin: EdgeInsets.only(top: 0, bottom: 0),
        width: MediaQuery.of(context).size.width * 2,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60)),
          ),
          elevation: 50,

          // color: Color.fromARGB(255, 255, 255, 255),
          child: Container(
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //         colors: [
            //       Color.fromARGB(255, 219, 247, 255),
            //       Color.fromARGB(255, 177, 214, 225),
            //     ])),
            margin: EdgeInsets.only(top: 0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 229, 246, 218),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 7, 90, 18),
                            blurRadius: 7,
                            blurStyle: BlurStyle.outer,
                            offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.book,
                              size: 30,
                              color: Color.fromARGB(255, 10, 10, 10),
                            ),
                            Text(
                              "  ${resultFromBooks[0]['BookName']}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 6, 5, 5),
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              "Author: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "${resultFromBooks[0]['Author']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 2,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              "Publisher: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "${resultFromBooks[0]['Publisher']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 0.5,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              "Year Of Publishing: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "${resultFromBooks[0]['YearOfPublishing']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 0.5,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              "Edition: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "${resultFromBooks[0]['Edition']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 0.5,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              "Available Copies: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "${resultFromNoOfCopies[0]['AvailableCopies']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.1)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    // padding: EdgeInsets.only(top: height / 3),
                    // margin: EdgeInsets.only(top: height * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //Delete Button
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          elevation: 5.0,
                          color: Color.fromARGB(255, 124, 222, 105),
                          padding: EdgeInsets.all(15.0),
                          child: Text("DELETE",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           deletePage(name: resultFromNoOfCopies)),
                            // );
                          },
                        ),

                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          elevation: 5.0,
                          color: Color.fromARGB(255, 124, 222, 105),
                          padding: EdgeInsets.all(15.0),
                          child: Text("UPDATE",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      updatePage(name: resultFromNoOfCopies)),
                            );
                          },
                        ),

                        //Issue Button
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          elevation: 5.0,
                          color: Color.fromARGB(255, 124, 222, 105),
                          padding: EdgeInsets.all(15.0),
                          child: Text("ISSUE",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           issuePage(name: resultFromNoOfCopies)),
                            // );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ), //Column
            ), //Padding
          ), //SizedBox
        ), //Card
      ), //Center
    );
  }
}
