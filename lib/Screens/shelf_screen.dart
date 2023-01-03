import 'package:flutter/material.dart';
import 'package:library_management_system/Objects/book.dart';
import 'package:library_management_system/Services/design.dart';
import 'package:library_management_system/Services/methods.dart';

class Shelf extends StatefulWidget {
  @override
  _ShelfState createState() => _ShelfState();
}

class _ShelfState extends State<Shelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Design.standartAppBar(context),
        body: Center(
            child: Container(
          child: FlatButton(
            child: Text("Test"),
            onPressed: () {
              List<Book> list = Methods.getBooklist();
              print(list[1].getTitle);
            },
          ),
        )));
  }
}
