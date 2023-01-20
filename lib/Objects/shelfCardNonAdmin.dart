import 'package:flutter/material.dart';
import '../Services/methods.dart';

class ShelfCardNonAdmin extends StatelessWidget {
  final Map<String, int> shelfs3;
  final List<String> urls;
  final Methods m;
  ShelfCardNonAdmin({this.shelfs3, this.urls, this.m});

  @override
  Widget build(BuildContext context) {
    if (shelfs3.length == 3) {
      Iterable<String> shelfkeys = shelfs3.keys;
      String first = shelfkeys.elementAt(0);
      String second = shelfkeys.elementAt(1);
      String third = shelfkeys.elementAt(2);

      return Card(
        key: key,
        margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0.0),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/booklist",
                        arguments: {'shelf': first, 'methods': m});
                  },
                  child: Row(
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
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
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
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/booklist",
                        arguments: {'shelf': second, 'methods': m});
                  },
                  child: Row(
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
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
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
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/booklist",
                        arguments: {'shelf': third, 'methods': m});
                  },
                  child: Row(
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
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    if (shelfs3.length == 2) {
      Iterable<String> shelfkeys = shelfs3.keys;
      String first = shelfkeys.elementAt(0);
      String second = shelfkeys.elementAt(1);

      return Card(
        margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/booklist",
                        arguments: {'shelf': first, 'methods': m});
                  },
                  child: Row(
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
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
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
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/booklist",
                        arguments: {'shelf': second, 'methods': m});
                  },
                  child: Row(
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
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Iterable<String> shelfkeys = shelfs3.keys;
    String first = shelfkeys.elementAt(0);

    return Card(
      margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 10,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/booklist",
                      arguments: {'shelf': first, 'methods': m});
                },
                child: Row(
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
