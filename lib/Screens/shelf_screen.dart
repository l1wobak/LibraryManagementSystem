import 'package:flutter/material.dart';
import 'package:library_management_system/Objects/book.dart';
import 'package:library_management_system/Objects/shelfCardNonAdmin.dart';
import 'package:library_management_system/Services/design.dart';
import 'package:library_management_system/Services/methods.dart';

import '../Objects/shelfCard.dart';

class Shelf extends StatefulWidget {
  @override
  _ShelfState createState() => _ShelfState();
}

Methods m;
Map routeData = {};

class _ShelfState extends State<Shelf> {
  @override
  void initState() {
    super.initState();
    //as soon as the screen gets called it gets refreshed data from webuntis
    Methods m = new Methods();
  }

  TextEditingController _textFieldController = TextEditingController();
  Future<void> displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add a new Shelf'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Shelf Name"),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('ADD'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    m.addShelf(codeDialog);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  String codeDialog;
  String valueText;
  @override
  Widget build(BuildContext context) {
    if (m != null) {
      routeData = ModalRoute.of(context).settings.arguments;
      if (routeData != null) m = routeData['methods'];
    } else
      m = new Methods();
    Map<String, int> shelfs = new Map();
    String shelfOfBook = "";
    List<String> urls = new List<String>();
    List<String> shelfsList = m.getShelfList();
    List<Book> booklist = m.getBooklist();
    booklist.map((book) {
      shelfOfBook = book.getLocation.substring(0, 1);

      if (shelfs.containsKey(shelfOfBook))
        shelfs[shelfOfBook] += 1;
      else {
        shelfs.addAll({shelfOfBook: 1});
      }
    }).toList();
    for (int i = 0; i < shelfsList.length; i++) {
      if (shelfs.containsKey(shelfsList[i])) {
        booklist.map((book) {
          shelfOfBook = book.getLocation.substring(0, 1);
          if (shelfsList[i] == shelfOfBook && urls.length <= i) {
            urls.add(book.getThumbnailUrl);
          }
        }).toList();
      } else {
        shelfs.addAll({shelfsList[i]: 0});
        urls.add(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Empty_book.jpg/1024px-Empty_book.jpg");
      }
    }
    Drawer drawer =
        (m.getCurrentUser() != null && m.getCurrentUser().getIsAdmin)
            ? Design.adminDrawer(context, m)
            : Design.standartDrawer(context, m);
    if (m.getCurrentUser() != null && m.getCurrentUser().getIsAdmin) {
      return Scaffold(
          drawer: drawer,
          appBar: Design.standartAppBar(context, m),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
              onPressed: () {
                displayTextInputDialog(context);
              }),
          body: Center(
              child: Container(
            child: ListView.builder(
              itemCount: (shelfsList.length / 3).ceil(),
              itemBuilder: (BuildContext context, int index) {
                if (index != 0) index += (2 * index);
                if (shelfsList.length <= index + 2) {
                  int diff = index + 2 - shelfsList.length;
                  if (diff == 1)
                    return ShelfCard(
                      shelfs3: {
                        shelfsList[index]: shelfs[shelfsList[index]],
                      },
                      urls: [
                        urls.elementAt(index),
                      ],
                      m: m,
                    );

                  return ShelfCard(
                    shelfs3: {
                      shelfsList[index]: shelfs[shelfsList[index]],
                      shelfsList[index + 1]: shelfs[shelfsList[index + 1]],
                    },
                    urls: [
                      urls.elementAt(index),
                      urls.elementAt(index + 1),
                    ],
                    m: m,
                  );
                }
                return ShelfCard(
                  shelfs3: {
                    shelfsList[index]: shelfs[shelfsList[index]],
                    shelfsList[index + 1]: shelfs[shelfsList[index + 1]],
                    shelfsList[index + 2]: shelfs[shelfsList[index + 2]]
                  },
                  urls: [
                    urls.elementAt(index),
                    urls.elementAt(index + 1),
                    urls.elementAt(index + 2)
                  ],
                  m: m,
                );
              },
            ),
          )));
    }

    return Scaffold(
        drawer: drawer,
        appBar: Design.standartAppBar(context, m),
        body: Center(
            child: Container(
          child: ListView.builder(
            itemCount: (shelfsList.length / 3).ceil(),
            itemBuilder: (BuildContext context, int index) {
              if (index != 0) index += (2 * index);
              if (shelfsList.length <= index + 2) {
                int diff = index + 2 - shelfsList.length;
                if (diff == 1)
                  return ShelfCardNonAdmin(
                    shelfs3: {
                      shelfsList[index]: shelfs[shelfsList[index]],
                    },
                    urls: [
                      urls.elementAt(index),
                    ],
                    m: m,
                  );

                return ShelfCardNonAdmin(
                  shelfs3: {
                    shelfsList[index]: shelfs[shelfsList[index]],
                    shelfsList[index + 1]: shelfs[shelfsList[index + 1]],
                  },
                  urls: [
                    urls.elementAt(index),
                    urls.elementAt(index + 1),
                  ],
                  m: m,
                );
              }
              return ShelfCardNonAdmin(
                shelfs3: {
                  shelfsList[index]: shelfs[shelfsList[index]],
                  shelfsList[index + 1]: shelfs[shelfsList[index + 1]],
                  shelfsList[index + 2]: shelfs[shelfsList[index + 2]]
                },
                urls: [
                  urls.elementAt(index),
                  urls.elementAt(index + 1),
                  urls.elementAt(index + 2)
                ],
                m: m,
              );
            },
          ),
        )));
  }
}
