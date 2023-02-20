import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_Book.dart';
import 'package:flutter_application_1/detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPage();
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach =>
      split(" ").map((str) => str.toUpperCase()).join(" ");
}

class _SearchPage extends State<SearchPage> {
  List searchResult = [];
  //List<Note> temp = [];

  String name = "";

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection("NoOfCopies")
        .where("BookName", isGreaterThanOrEqualTo: query.capitalizeFirstofEach)
        .get();

    setState(() {
      searchResult = result.docs.toList();
      print(result.docs.toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white60,
      appBar: AppBar(
        centerTitle: true,
        //255, 81, 202, 101
        //83, 178, 66, 1
        // 255, 119, 214, 127
        //255, 4, 167, 69
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 81, 202, 101),
        foregroundColor: Colors.white,
        title: const Text("Search Page",
            style: TextStyle(
                color: Color.fromARGB(240, 245, 241, 241),
                fontStyle: FontStyle.normal,
                fontSize: 30)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              cursorColor: Color.fromARGB(255, 81, 202, 101),
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                // ignore: prefer_const_constructors
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                      color: const Color.fromARGB(255, 81, 202, 101),
                      width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 81, 202, 101),
                      width: 3.0),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(100),
                // ),
                hintText: 'Search here',
              ),
              onChanged: (query) {
                searchFromFirebase(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Color.fromARGB(255, 179, 228, 187), width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color.fromARGB(255, 233, 252, 228),
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                    textColor: Color.fromARGB(255, 7, 7, 7),
                    title: Text('${searchResult[index]['BookName']}'),
                    subtitle: Text(
                        'Total_Copies ${searchResult[index]['AvailableCopies']} '),
                    onTap: () {
                      name = searchResult[index]['BookName'];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen((name)),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
