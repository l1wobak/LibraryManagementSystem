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
          child: MaterialButton(
            child: Text("Test"),
            onPressed: () {
              Methods m = new Methods();
              List<Book> list = m.getBooklist();
              print(list[1].location);
              print(list[230].location);
              print(list[430].location);
            },
          ),
        )));
  }
}
