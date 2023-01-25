import 'package:flutter/material.dart';
import 'package:library_management_system/Objects/book.dart';
import 'package:library_management_system/Objects/user.dart';
import 'package:library_management_system/Services/methods.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Methods m;
  UserCard({this.user, this.m});

  @override
  Widget build(BuildContext context) {
    int borrowedbooks =
        (user.getBorrowedbooks == null) ? 0 : user.getBorrowedbooks.length;
    String username = (user.getUsername == null) ? "unknown" : user.getUsername;
    String email = (user.getEmail == null) ? "Unknown" : user.getEmail;
    String phonenumber =
        (user.getPhoneNumber == null) ? "Unknown" : user.getPhoneNumber;
    return Card(
      margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Column(
              children: <Widget>[
                Text(username),
                Text(email),
                Text(phonenumber),
              ],
            ),
          ),
          Expanded(flex: 3, child: Text("$borrowedbooks Books borrowed")),
          Expanded(
              flex: 1,
              child: PopupMenuButton(
                  icon: Icon(Icons.more_horiz),
                  iconSize: 25,
                  onSelected: (value) {
                    switch (value) {
                      case "see":
                        Navigator.pushNamed(context, '/booklist', arguments: {
                          'methods': m,
                          'booklist': user.getBorrowedbooks
                        });
                        break;
                      case "return":
                        m.returnBooklist(user.getBorrowedbooks);
                        user.setBorrowedbooks = null;
                        Navigator.pushNamed(context, '/alluserlist',
                            arguments: {'methods': m});
                        break;
                      case "delete":
                        m.getUserlist().remove(user);
                        Navigator.pushNamed(context, '/alluserlist',
                            arguments: {'methods': m});
                        break;
                      default:
                    }
                  },
                  itemBuilder: (BuildContext bc) {
                    return const [
                      PopupMenuItem(
                        child: Text("See users Books"),
                        value: "see",
                      ),
                      PopupMenuItem(
                        child: Text("Return all"),
                        value: "return",
                      ),
                      PopupMenuItem(
                        child: Text("Delete User"),
                        value: "delete",
                      ),
                    ];
                  })),
        ],
      ),
    );
  }
}
