import 'package:flutter/material.dart';
import 'package:library_management_system/Objects/book.dart';
import 'package:library_management_system/Services/design.dart';
import 'package:library_management_system/Services/methods.dart';

import '../Objects/shelfCard.dart';

class Shelf extends StatefulWidget {
  @override
  _ShelfState createState() => _ShelfState();
}

class _ShelfState extends State<Shelf> {
  @override
  Widget build(BuildContext context) {
    Methods m = new Methods();
    Map<String, int> shelfs = new Map();
    String shelfOfBook = "";
    List<String> urls = new List<String>();
    m.getBooklist().map((book) {
      shelfOfBook = book.getLocation.substring(0, 1);

      if (shelfs.containsKey(shelfOfBook))
        shelfs[shelfOfBook] += 1;
      else {
        shelfs.addAll({shelfOfBook: 1});

        urls.add(book.getThumbnailUrl);
      }
    }).toList();
    int smalllettera = "a".codeUnitAt(0);
    return Scaffold(
        drawer: Design.standartDrawer(context),
        appBar: Design.standartAppBar(context),
        body: Center(
            child: Container(
          child: ListView.builder(
            itemCount: (shelfs.length / 3).floor(),
            itemBuilder: (BuildContext context, int index) {
              if (index != 0) index += (2 * index);

              return ShelfCard(shelfs3: {
                String.fromCharCode(smalllettera + index):
                    shelfs[String.fromCharCode(smalllettera + index)],
                String.fromCharCode(smalllettera + index + 1):
                    shelfs[String.fromCharCode(smalllettera + index + 1)],
                String.fromCharCode(smalllettera + index + 2):
                    shelfs[String.fromCharCode(smalllettera + index + 2)]
              }, urls: [
                urls.elementAt(index),
                urls.elementAt(index + 1),
                urls.elementAt(index + 2)
              ]);
            },
          ),
        )));
  }
}
