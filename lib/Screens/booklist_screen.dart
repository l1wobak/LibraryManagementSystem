import 'package:flutter/material.dart';
import 'package:library_management_system/Services/design.dart';


class Booklist extends StatefulWidget {
  @override
  _BooklistState createState() => _BooklistState();
}


class _BooklistState extends State<Booklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Design.standartAppBar(context),
    );
  }
}