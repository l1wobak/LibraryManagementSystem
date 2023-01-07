import 'package:flutter/material.dart';
import 'package:library_management_system/Services/design.dart';
import 'package:library_management_system/Services/methods.dart';

import '../Objects/book.dart';

class BookDetails extends StatefulWidget {
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    Methods methods = new Methods();
    List<Book> allBooks = methods.getBooklist();
    Book book = allBooks.elementAt(0);
    book.available = false;
    var lendable = "Not Available";
    Color avail = Colors.redAccent;
    if (book.available) {
      lendable = "Available";
      avail = Colors.greenAccent;
    }

    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        new GlobalKey<RefreshIndicatorState>();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: Design.standartAppBar(context),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Column(
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.network('${book.getThumbnailUrl}',
                      height: 450.0, scale: 0.5),
                ]),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '${book.getTitle}',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 5,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ]),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Authors: ${book.getAuthors[0]}',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 5,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ]),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Categories: ${book.getCategories}',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 5),
                ]),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(' 450 Pages, Released: 01.04.2009',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 5),
                ]),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                      '________________________________________________________',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 5),
                ]),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Description: ',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 5),
                ]),
            Expanded(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                        child: Text('${book.getLongDescription}',
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 5)),
                  ]),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      color: avail,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: const Text(
                        'not Available',
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }

  Future<void> _refresh() {}
}
