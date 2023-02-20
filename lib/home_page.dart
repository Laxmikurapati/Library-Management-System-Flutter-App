// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/main.dart';
// import 'package:flutter_application_1/search_page.dart';

// void main() => runApp(homePage());

// class homePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Color.fromARGB(255, 237, 205, 77),
//           title: Text(
//             "Home Page",
//             style: TextStyle(
//               color: Color.fromARGB(255, 3, 3, 3),
//               fontWeight: FontWeight.bold,
//               fontSize: 24,
//             ),
//           ),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               const SizedBox(
//                 height: 320,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SearchPage()),
//                   );
//                 },
//                 child: Container(
//                   height: 60.0,
//                   width: 250.0,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             offset: Offset(0.0, 20.0),
//                             blurRadius: 50.0,
//                             color: Colors.black12)
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(22.0)),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         height: 100.0,
//                         width: 180.0,
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 5.0, horizontal: 5.0),
//                         // ignore: sort_child_properties_last
//                         child: Text(
//                           "Search",
//                           style: TextStyle(fontSize: 35, fontFamily: "regular"),
//                           textAlign: TextAlign.center,

//                           // .apply(color:Colors.black12),
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.greenAccent,
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(95.0),
//                                 topLeft: Radius.circular(95.0),
//                                 bottomRight: Radius.circular(200.0))),
//                       ),
//                       Icon(Icons.search, size: 40.0)
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   height: 60.0,
//                   width: 250.0,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             offset: Offset(0.0, 20.0),
//                             blurRadius: 50.0,
//                             color: Colors.black12)
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(22.0)),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         height: 100.0,
//                         width: 180.0,
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 5.0, horizontal: 5.0),
//                         // ignore: sort_child_properties_last
//                         child: Text(
//                           "Scan",
//                           style: TextStyle(fontSize: 35, fontFamily: "regular"),
//                           textAlign: TextAlign.center,

//                           // .apply(color:Colors.black12),
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.greenAccent,
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(95.0),
//                                 topLeft: Radius.circular(95.0),
//                                 bottomRight: Radius.circular(200.0))),
//                       ),
//                       Icon(Icons.qr_code_scanner_outlined, size: 40.0)
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   height: 60.0,
//                   width: 250.0,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             offset: Offset(0.0, 20.0),
//                             blurRadius: 50.0,
//                             color: Colors.black12)
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(22.0)),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         height: 100.0,
//                         width: 180.0,
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 5.0, horizontal: 5.0),
//                         // ignore: sort_child_properties_last
//                         child: Text(
//                           "Add Book",
//                           style: TextStyle(fontSize: 35, fontFamily: "regular"),
//                           textAlign: TextAlign.center,

//                           // .apply(color:Colors.black12),
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.greenAccent,
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(95.0),
//                                 topLeft: Radius.circular(95.0),
//                                 bottomRight: Radius.circular(200.0))),
//                       ),
//                       Icon(Icons.book, size: 40.0)
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_Book.dart';
// ignore: unused_import
import 'package:flutter_application_1/delete_Page.dart';
import 'package:flutter_application_1/search_page.dart';

import 'detail_screen.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach =>
      split(" ").map((str) => str.toUpperCase()).join(" ");
}

class _homePageState extends State<homePage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  bool flag = false;
  String name = "";
  List searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        //255, 81, 202, 101
        //83, 178, 66, 1
        // 255, 119, 214, 127
        //255, 4, 167, 69
        backgroundColor: const Color.fromARGB(255, 81, 202, 101),
        foregroundColor: Colors.white,
        title: const Text("Home Page",
            style: TextStyle(
                color: Color.fromARGB(240, 245, 241, 241),
                fontStyle: FontStyle.normal,
                fontSize: 30)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Image.asset(
                "asset/book.png",
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
              child: Container(
                height: 60.0,
                width: 250.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 50.0,
                          color: Colors.black12)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 180.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Search",
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: "regular",
                            color: Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.center,
                      ),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 196, 252, 132),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(95.0),
                              topLeft: Radius.circular(95.0),
                              bottomRight: Radius.circular(200.0))),
                    ),
                    const Icon(Icons.search, size: 40.0)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60.0,
                width: 250.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 50.0,
                          color: Colors.black12)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 180.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Scan",
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: "regular",
                            color: Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.center,

                        // .apply(color:Colors.black12),
                      ),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 233, 154, 247),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(95.0),
                              topLeft: Radius.circular(95.0),
                              bottomRight: Radius.circular(200.0))),
                    ),
                    const Icon(Icons.qr_code_scanner_outlined, size: 40.0)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addBook()),
                );
              },
              child: Container(
                height: 60.0,
                width: 250.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 50.0,
                          color: Colors.black12)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 180.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Add Book",
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: "regular",
                            color: Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.center,

                        // .apply(color:Colors.black12),
                      ),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 247, 123, 114),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(95.0),
                              topLeft: Radius.circular(95.0),
                              bottomRight: Radius.circular(200.0))),
                    ),
                    const Icon(Icons.book, size: 40.0)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
