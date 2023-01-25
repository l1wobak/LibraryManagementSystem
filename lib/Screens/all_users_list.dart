import 'package:flutter/material.dart';
import 'package:library_management_system/Objects/user.dart';
import 'package:library_management_system/Objects/userCard.dart';
import 'package:library_management_system/Services/design.dart';
import 'package:library_management_system/Services/methods.dart';

import '../Objects/book.dart';

class AllUserList extends StatefulWidget {
  @override
  _AllUserListState createState() => _AllUserListState();
}

Methods m;
Map routeData = {};

class _AllUserListState extends State<AllUserList> {
  @override
  Widget build(BuildContext context) {
    routeData = ModalRoute.of(context).settings.arguments;
    m = routeData['methods'];
    List<User> allUsers = m.getUserlist();

    return Scaffold(
      appBar: Design.standartAppBar(context, m),
      drawer: Design.adminDrawer(context, m),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 16.0),
              color: Colors.white10,
              //The Listviewbuilder needs a list and can build a unique Card for each item in the list.
              child: ListView.builder(
                itemCount: allUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(user: allUsers[index], m: m);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
