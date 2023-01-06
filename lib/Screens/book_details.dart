import 'package:flutter/material.dart';
import 'package:library_management_system/Objects/book.dart';
import 'package:library_management_system/Services/design.dart';
import 'package:library_management_system/Services/methods.dart';

class BookDetails extends StatefulWidget {
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    Methods m = new Methods();
    List<Book> list = m.getBooklist();
    Book book = list[0];
    String url = book.getThumbnailUrl;
    return Scaffold(
      appBar: Design.standartAppBar(context),
      body: Image.network(url),
    );
  }
}
