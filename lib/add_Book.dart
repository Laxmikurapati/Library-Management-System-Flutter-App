import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/home_page.dart';

class Book {
  String BookName = "";
  var AccNo;
  String BarCode = "";
  var RowNo;
  var ShelfNo;
  var RackNo;
  String Author = "";
  String Publisher = "";
  var YearOfPublishing = 0;
  var Edition = 0;
  int Availability = 1;

  Book({
    required this.BookName,
    required this.AccNo,
    required this.BarCode,
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
        'BookName': BookName,
        'AccNo': AccNo,
        'BarCode': BarCode,
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

class Copies {
  String BookName = "";
  var TotalCopies;
  var AvailableCopies;
  var IssuedCopies;

  Copies({
    required this.BookName,
    required this.TotalCopies,
    required this.AvailableCopies,
    required this.IssuedCopies,
  });

  Map<String, dynamic> toJson() => {
        'BookName': BookName,
        'TotalCopies': TotalCopies,
        'AvailableCopies': AvailableCopies,
        'IssuedCopies': IssuedCopies,
      };
}

class addBook extends StatefulWidget {
  @override
  _addBookState createState() => _addBookState();
}

class _addBookState extends State<addBook> {
  final ctrlBookName = TextEditingController();
  final ctrlAccNo = TextEditingController();
  final ctrlBarCode = TextEditingController();
  final ctrlRowNo = TextEditingController();
  final ctrlShelfNo = TextEditingController();
  final ctrlRackNo = TextEditingController();
  final ctrlAuthor = TextEditingController();
  final ctrlPublisher = TextEditingController();
  final ctrlYearOfPublishing = TextEditingController();
  final ctrlEdition = TextEditingController();
  final ctrlAvailability = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 81, 202, 101),
        foregroundColor: Colors.white,
        title: const Text("New Book",
            style: TextStyle(
                color: Color.fromARGB(240, 245, 241, 241),
                fontStyle: FontStyle.normal,
                fontSize: 30)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Color.fromARGB(255, 41, 184, 227),
            //     Color.fromARGB(255, 41, 184, 227)
            //   ],
            // ),
            ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Center(
                  child: Container(
                    // alignment: ,
                    child: RichText(
                      text: TextSpan(
                        text: "Enter the Details of New Book",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(.8),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 239, 246, 231),
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 81, 202, 101),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Book Name',
                        hintText: 'Book Name',
                      ),
                      controller: ctrlBookName,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 239, 246, 231),
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
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
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
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
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
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
                    border:
                        Border.all(color: Color.fromARGB(255, 248, 246, 246)),
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
                    border:
                        Border.all(color: Color.fromARGB(255, 248, 247, 247)),
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 246, 231),
                    border:
                        Border.all(color: Color.fromARGB(255, 253, 252, 252)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 81, 202, 101),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Author',
                        hintText: 'Author',
                      ),
                      controller: ctrlAuthor,
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
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 81, 202, 101),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Publisher',
                        hintText: 'Publisher',
                      ),
                      controller: ctrlPublisher,
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
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 81, 202, 101),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Year Of Publishing',
                        hintText: 'Year Of Publishing',
                      ),
                      controller: ctrlYearOfPublishing,
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
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 81, 202, 101),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Edition',
                        hintText: 'Edition',
                      ),
                      controller: ctrlEdition,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                      padding: const EdgeInsets.all(13),
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 5.0,
                      color: const Color.fromARGB(255, 81, 202, 101),
                      padding: const EdgeInsets.all(13.0),
                      child: Text(
                        "DELETE",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        final book = Book(
                          AccNo: int.parse(ctrlAccNo.text),
                          BarCode: ctrlBarCode.text,
                          BookName: ctrlBookName.text,
                          RowNo: int.parse(ctrlRowNo.text),
                          ShelfNo: int.parse(ctrlShelfNo.text),
                          RackNo: int.parse(ctrlRackNo.text),
                          Author: ctrlAuthor.text,
                          Publisher: ctrlPublisher.text,
                          YearOfPublishing:
                              int.parse(ctrlYearOfPublishing.text),
                          Edition: int.parse(ctrlEdition.text),
                          Availability: 1,
                        );
                        final copies = Copies(
                          BookName: ctrlBookName.text,
                          TotalCopies: 1,
                          AvailableCopies: 1,
                          IssuedCopies: 0,
                        );
                        updateBook(book, copies);
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }

  Future updateBook(Book book, Copies copies) async {
    final docBooks = FirebaseFirestore.instance.collection('Books').doc();
    final jsonOfBook = book.toJson();
    await docBooks.set(jsonOfBook);
    final docNoOfCopies =
        FirebaseFirestore.instance.collection('NoOfCopies').doc();
    final jsonOfCopies = copies.toJson();
    await docNoOfCopies.set(jsonOfCopies);
  }
}
