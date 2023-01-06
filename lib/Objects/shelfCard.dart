import 'package:flutter/material.dart';
import 'package:library_management_system/Objects/book.dart';

class ShelfCard extends StatelessWidget {
  final Map<String, int> shelfs3;
  final List<String> urls;

  ShelfCard({this.shelfs3, this.urls});

  @override
  Widget build(BuildContext context) {
    Iterable<String> shelfkeys = shelfs3.keys;
    String first = shelfkeys.elementAt(0);
    String second = shelfkeys.elementAt(1);
    String third = shelfkeys.elementAt(2);

    return Card(
      margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, "/booklist");
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        urls[0],
                        height: 120,
                        width: 70,
                      ),
                      Container(
                        width: 80,
                        color: Colors.blueAccent,
                        alignment: Alignment.center,
                        child: Text("Shelf $first",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      )
                    ],
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      color: Colors.black12,
                      width: 100,
                      alignment: Alignment.center,
                      child: Text("${shelfs3[first]} Books"),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        urls[1],
                        height: 120,
                        width: 70,
                      ),
                      Container(
                        width: 80,
                        color: Colors.blueAccent,
                        alignment: Alignment.center,
                        child: Text("Shelf $second",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      )
                    ],
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      color: Colors.black12,
                      width: 100,
                      alignment: Alignment.center,
                      child: Text("${shelfs3[second]} Books"),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        urls[2],
                        height: 120,
                        width: 70,
                      ),
                      Container(
                        width: 80,
                        color: Colors.blueAccent,
                        alignment: Alignment.center,
                        child: Text("Shelf $third",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      )
                    ],
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      color: Colors.black12,
                      width: 100,
                      alignment: Alignment.center,
                      child: Text("${shelfs3[third]} Books"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
