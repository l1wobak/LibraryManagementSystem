import 'package:flutter/material.dart';
import 'package:library_management_system/Services/design.dart';
import 'package:library_management_system/Services/methods.dart';

import '../Objects/book.dart';
import '../Objects/bookCard.dart';
import '../Objects/search_widget.dart';

class Booklist extends StatefulWidget {
  @override
  _BooklistState createState() => _BooklistState();
}

class _BooklistState extends State<Booklist> {
  @override
  Widget build(BuildContext context) {
    Methods methods = new Methods();
    List<Book> allBooks = methods.getBooklist();
    List<Book> testBooks = methods.getTestList();
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        new GlobalKey<RefreshIndicatorState>();

    return Scaffold(
      appBar: Design.standartAppBar(context),
      drawer: Design.standartDrawer(context),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 16.0),
                color: Colors.white10,
                //The Listviewbuilder needs a list and can build a unique Card for each item in the list.
                child: ListView.builder(
                  itemCount: testBooks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BookCard(book: testBooks[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refresh() {}
}

Widget buildSearch() => SearchWidget(
      text: 'query',
      hintText: 'search',
      onChanged: searchBook,
    );

void searchBook(String query) {}
