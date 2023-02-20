import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/constants.dart';

class Book {
  var AccNo;
  String BarCode = "";
  String BookName = "";
  var RowNo;
  var ShelfNo;
  var RackNo;
  String Author = "";
  String Publisher = "";
  var YearOfPublishing = 0;
  var Edition = 0;
  int Availability = 1;

  Book({
    required this.AccNo,
    required this.BarCode,
    required this.BookName,
    required this.RowNo,
    required this.ShelfNo,
    required this.RackNo,
    required this.Author,
    required this.Publisher,
    required this.YearOfPublishing,
    required this.Edition,
    required this.Availability,
  });

  Map<String, dynamic> toJson() => {
        'AccNo': AccNo,
        'BarCode': BarCode,
        'BookName': BookName,
        'RowNo': RowNo,
        'ShelfNo': ShelfNo,
        'RackNo': RackNo,
        'Author': Author,
        'Publisher': Publisher,
        'YearOfPublishing': YearOfPublishing,
        'Edition': Edition,
        'Availability': Availability,
      };
}

class updatePage extends StatefulWidget {
  List name;
  updatePage({super.key, required this.name});
  @override
  _updatePageState createState() => _updatePageState(name: name);
}

class _updatePageState extends State<updatePage> {
  List name;

  String author = "";
  String publisher = "";
  int yearofpublishing = 0;
  int edition = 0;

  var docIDforCopies;

  _updatePageState({required this.name});
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final ctrlAccNo = TextEditingController();
  final ctrlBarCode = TextEditingController();
  final ctrlRowNo = TextEditingController();
  final ctrlShelfNo = TextEditingController();
  final ctrlRackNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // changesInNoOfCopies();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 81, 202, 101),
        foregroundColor: Colors.white,
        title: const Text("Update Book",
            style: TextStyle(
                color: Color.fromARGB(240, 245, 241, 241),
                fontStyle: FontStyle.normal,
                fontSize: 30)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.book,
                    size: 30,
                    color: Color.fromARGB(255, 10, 10, 10),
                  ),
                  Text(
                    "  ${name[0]['BookName']}",
                    style: TextStyle(
                      color: Color.fromARGB(255, 5, 5, 5),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 246, 231),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 81, 202, 101),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Accession No',
                        hintText: 'Accession No',
                      ),
                      controller: ctrlAccNo,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 246, 231),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 81, 202, 101),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Bar Code',
                        hintText: 'Bar Code',
                      ),
                      controller: ctrlBarCode,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 246, 231),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 81, 202, 101),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Row No',
                        hintText: 'Row No',
                      ),
                      controller: ctrlRowNo,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 246, 231),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 81, 202, 101),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Shelf No',
                        hintText: 'Shelf No',
                      ),
                      controller: ctrlShelfNo,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 246, 231),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 81, 202, 101),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Rack No',
                        hintText: 'Rack No',
                      ),
                      controller: ctrlRackNo,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 5.0,
                      color: const Color.fromARGB(255, 81, 202, 101),
                      padding: const EdgeInsets.all(15.0),
                      child: Text("CANCEL",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 5.0,
                      color: const Color.fromARGB(255, 81, 202, 101),
                      padding: const EdgeInsets.all(15.0),
                      child: Text("DELETE",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        final book = Book(
                          BookName: name[0]['BookName'],
                          AccNo: int.parse(ctrlAccNo.text),
                          BarCode: ctrlBarCode.text,
                          RowNo: int.parse(ctrlRowNo.text),
                          ShelfNo: int.parse(ctrlShelfNo.text),
                          RackNo: int.parse(ctrlRackNo.text),
                          Author: name[0]['Author'],
                          Publisher: name[0]['Publisher'],
                          YearOfPublishing: name[0]['YearOfPublishing'],
                          Edition: name[0]['Edition'],
                          Availability: 1,
                        );
                        updateBook(book);
                      },
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

  Future updateBook(Book book) async {
    final docBook = FirebaseFirestore.instance.collection('Books').doc();
    final json = book.toJson();
    await docBook.set(json);
  }

  Future changesInNoOfCopies() async {
    await FirebaseFirestore.instance
        .collection('NoOfCopies')
        .orderBy('BookName')
        .where('BookName', isGreaterThanOrEqualTo: name[0]['BookName'])
        .where('BookName', isLessThan: name[0]['BookName'] + 'z')
        .get()
        .then((value) {
      docIDforCopies = value.docs[0].id;

      FirebaseFirestore.instance
          .collection('NoOfCopies')
          .doc(docIDforCopies)
          .update({
        'AvailableCopies': value.docs[0]['AvailableCopies'] + 1,
        'TotalCopies': value.docs[0]['TotalCopies'] + 1
      });
    });
  }
}

// String? validateCopies(String? ctrlAccNo, ctrlBarCode, ctrlRowNo, ctrlShelfNo, ctrlRackNo) {
//   if (ctrlAccNo == null)
//     return '* This field is mandatory';
//   return null;
// }