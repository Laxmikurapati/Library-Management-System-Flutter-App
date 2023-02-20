import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          //255, 81, 202, 101
          //83, 178, 66, 1
          // 255, 119, 214, 127
          //255, 4, 167, 69
          backgroundColor: const Color.fromARGB(255, 81, 202, 101),
          foregroundColor: Colors.white,
          title: const Text("Search Page",
              style: TextStyle(
                  color: Color.fromARGB(240, 245, 241, 241),
                  fontStyle: FontStyle.normal,
                  fontSize: 30)),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 150.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 30.0,
                          color: Colors.black12)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 110.0,
                      margin: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12.0),
                      child: Text("Button",
                          style: Theme.of(context).textTheme.button
                          // .apply(color:Colors.black12),
                          ),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(95.0),
                              topLeft: Radius.circular(95.0),
                              bottomRight: Radius.circular(200.0))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // body: Center(
        //   child: InkWell(
        //     onTap: () => null,
        //     child: Container(
        //       height: 50.0,
        //       width: 150.0,
        //       decoration: BoxDecoration(
        //           boxShadow: [
        //             BoxShadow(
        //                 offset: Offset(0.0, 20.0),
        //                 blurRadius: 30.0,
        //                 color: Colors.black12)
        //           ],
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(22.0)),
        //       child: Row(
        //         children: <Widget>[
        //           Container(
        //             height: 50.0,
        //             width: 110.0,
        //             margin:
        //                 EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        //             child:
        //                 Text("Button", style: Theme.of(context).textTheme.button
        //                     // .apply(color:Colors.black12),
        //                     ),
        //             decoration: BoxDecoration(
        //                 color: Colors.greenAccent,
        //                 borderRadius: BorderRadius.only(
        //                     bottomLeft: Radius.circular(95.0),
        //                     topLeft: Radius.circular(95.0),
        //                     bottomRight: Radius.circular(200.0))),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
      ),
    );
  }
}
