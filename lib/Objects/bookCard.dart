import 'package:flutter/material.dart';
import 'package:library_management_system/Objects/book.dart';
import 'package:library_management_system/Objects/user.dart';

import '../Services/methods.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final Methods m;
  List<String> usernames;
  String selectedItem = "";

  BookCard({this.book, this.m});
  void OpenDialog(bool borrow) {
    if (!borrow) {
      List<Book> newBooks = book.getUser.borrowedbooks;
      newBooks.remove(book);
      book.getUser.setBorrowedbooks = newBooks;
      book.setUser(null);
      book.setAvailable = true;
    } else {}
  }

  TextEditingController _textFieldController = TextEditingController();
  Future<void> displayTextInputDialog(BuildContext context) async {
    if (selectedItem == "") {
      selectedItem = usernames[0];
    }
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Borrow for user'),
            content: DropdownButton<String>(
              value: selectedItem,
              items: usernames
                  .map((user) =>
                      DropdownMenuItem(child: Text(user), value: user))
                  .toList(),
              onChanged: (value) {
                selectedItem = value;
              },
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/booklist",
                      arguments: {'methods': m});
                },
              ),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('CONFIRM'),
                onPressed: () {
                  book.setUser(m.getUserFromName(selectedItem));
                  book.setAvailable = false;

                  m.getUserFromName(selectedItem).borrowedbooks.add(book);

                  Navigator.pushReplacementNamed(context, "/booklist",
                      arguments: {'methods': m});
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var lended = "Available";
    var lendable = "Borrow";
    var lendableUser = "Available";
    usernames = m.getAllUsernames();

    Color avail = Color.fromRGBO(4, 240, 4, 1);
    bool borrow = true;
    if (!book.available) {
      lended = "Borrowed by: " + book.getUser.username;
      lendable = "Return";
      lendableUser = "Unavailable";
      borrow = false;
      avail = Colors.redAccent;
    }

    if (m.getCurrentUser() != null &&
        m.getCurrentUser().getIsAdmin &&
        !book.available) {
      return Card(
        color: Colors.blueGrey,
        margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, "/bookdetails",
                arguments: {'book': book, 'methods': m});
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.network('${book.getThumbnailUrl}',
                                  height: 100.0),
                            ]),
                        Flexible(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '${book.getTitle}',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '${"Location: " + book.getLocation}',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 5,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text('Authors: ${book.getAuthors[0]}',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 5),
                                Text(
                                    'Categories: ${book.getCategories.toString().replaceAll("[", "").replaceAll("]", "")}',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 5),
                                Text(
                                  '$lended',
                                  style: TextStyle(color: avail),
                                ),
                                TextButton(
                                  onPressed: () {
                                    OpenDialog(borrow);
                                    Navigator.pushReplacementNamed(
                                        context, "/booklist",
                                        arguments: {'methods': m});
                                  },
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
                              ],
                            ),
                          ),
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
              ],
            ),
          ),
        ),
      );
    } else if (m.getCurrentUser() != null && m.getCurrentUser().getIsAdmin) {
      return Card(
        color: Colors.blueGrey,
        margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, "/bookdetails",
                arguments: {'book': book, 'methods': m});
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.network('${book.getThumbnailUrl}',
                                  height: 100.0),
                            ]),
                        Flexible(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '${book.getTitle}',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '${"Location: " + book.getLocation}',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 5,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text('Authors: ${book.getAuthors[0]}',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 5),
                                Text(
                                    'Categories: ${book.getCategories.toString().replaceAll("[", "").replaceAll("]", "")}',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 5),
                                Text(
                                  '$lended',
                                  style: TextStyle(color: avail),
                                ),
                                TextButton(
                                  onPressed: () {
                                    displayTextInputDialog(context);
                                    //Navigator.pushReplacementNamed(
                                    //  context, "/booklist",
                                    //arguments: {'methods': m});
                                  },
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
                              ],
                            ),
                          ),
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
              ],
            ),
          ),
        ),
      );
    } else {
      return Card(
        color: Colors.blueGrey,
        margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, "/bookdetails",
                arguments: {'book': book, 'methods': m});
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.network('${book.getThumbnailUrl}',
                                  height: 100.0),
                            ]),
                        Flexible(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '${book.getTitle}',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '${"Location: " + book.getLocation}',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 5,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text('Authors: ${book.getAuthors[0]}',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 5),
                                Text(
                                    'Categories: ${book.getCategories.toString().replaceAll("[", "").replaceAll("]", "")}',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 5),
                                Text(
                                  '$lendableUser',
                                  style: TextStyle(color: avail),
                                ),
                              ],
                            ),
                          ),
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
              ],
            ),
          ),
        ),
      );
    }
  }
}
