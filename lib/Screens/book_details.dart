import 'package:flutter/material.dart';
import 'package:library_management_system/Services/design.dart';

class BookDetails extends StatefulWidget {
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Design.standartAppBar(context),
    );
  }
}
