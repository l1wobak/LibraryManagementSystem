import 'package:flutter/material.dart';
import 'package:library_management_system/Services/design.dart';
import 'package:library_management_system/Services/methods.dart';

import '../Objects/book.dart';

class BookDetails extends StatefulWidget {
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

Methods methods;
Book book;
Map routeData = {};
String longDescription;

/**
 * TODO
 * DONE add function to get here from booklist (prob get book through modalroute)
 * DONE add location information
 * add some admin functions like borrow / return and the like
 * 
 * 
 * */
class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    routeData = ModalRoute.of(context).settings.arguments;
    methods = routeData['methods'];
    book = routeData['book'];
    longDescription = (book.getLongDescription != null)
        ? longDescription = book.getLongDescription
        : longDescription = "No description available";
    var lendable = "Not Available";
    Color avail = Colors.redAccent;
    if (book.available) {
      lendable = "Available (Talk to Librarian to borrow)";
      avail = Colors.greenAccent;
    }
    List<String> location = book.getLocation.split(';');
    List<String> published = book.getPublishedDate.toString().split(" ");

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: Design.standartAppBar(context, methods),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.network('${book.getThumbnailUrl}',
                              height: 300.0, scale: 0.25),
                        ]),
                    Flexible(
                      child: Container(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                '${book.getTitle}',
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            ]),
                      ),
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Shelf: ${location[0]}, Row: ${location[1]}, Place: ${location[2]}",
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 5,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
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
                          Text(
                              'Published: ${published[0]}, ${book.getPagecount.toString()} pages',
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            '${longDescription}',
                            softWrap: true,
                          )),
                        ]),
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
                              child: Text(
                                '${lendable}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13.0),
                              ),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() {}
}
