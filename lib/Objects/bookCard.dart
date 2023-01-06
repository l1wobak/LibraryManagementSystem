import 'package:flutter/material.dart';
import 'package:library_management_system/Objects/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({this.book});

  @override
  Widget build(BuildContext context) {
    var lendable = "Not Available";
    Color avail = Colors.redAccent;
    if (book.available) {
      lendable = "Available";
      avail = Color.fromRGBO(4, 240, 4, 1);
    }
    return Card(
      color: Colors.cyan,
      margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.network('${book.getThumbnailUrl}', height: 100.0),
                    ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '${book.getTitle}',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 5,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text('Authors: ${book.getAuthors[0]}',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 5),
                    Text('Categories: ${book.getCategories}',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 5),
                    Text(
                      '$lendable',
                      style: TextStyle(color: avail),
                    ),
                  ],
                ),
              ]),
              Column(
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
