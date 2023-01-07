import 'package:flutter/material.dart';
import 'package:library_management_system/Screens/booklist_screen.dart';
import 'package:library_management_system/Screens/login_screen.dart';
import 'package:library_management_system/Screens/shelf_screen.dart';

class Design {
  static TextStyle smallLetterYellow() {
    return TextStyle(
        color: Colors.yellowAccent, fontSize: 18.0, letterSpacing: 1.0);
  }

  static TextStyle bigLetterYellow() {
    return TextStyle(
        color: Colors.yellowAccent,
        fontSize: 24.0,
        letterSpacing: 1.0,
        fontWeight: FontWeight.bold);
  }

  static TextStyle mainTitleTextStyleWhite() {
    return TextStyle(
        letterSpacing: 2.0,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.white);
  }

  static TextStyle mainTitleTextStyleYellow() {
    return TextStyle(
        letterSpacing: 2.0,
        fontSize: 45.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.amber[800],
        shadows: <Shadow>[
          Shadow(
              offset: Offset(2.0, 3.0),
              blurRadius: 4.0,
              color: Colors.black.withOpacity(0.4))
        ]);
  }

  static TextStyle smallGreyLetters() {
    return TextStyle(
      fontSize: 12.0,
      color: Colors.grey[500],
    );
  }

  static TextStyle normalText() {
    return TextStyle(fontSize: 18, color: Colors.black);
  }

  static TextStyle hyperLinkLetter() {
    return TextStyle(
      fontSize: 24,
      color: Color.fromARGB(255, 22, 144, 214),
    );
  }

  static TextStyle bigLetters() {
    return TextStyle(
      fontSize: 24.0,
      letterSpacing: 1.0,
    );
  }

  static Drawer standartDrawer(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Text(
              'Library Management System',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.white),
            )),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('My books'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Booklist()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Shelf()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login / Signup'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
            ),
            title: Text(
              'About',
            ),
            onTap: () {
              return showAboutDialog(
                context: context,
                applicationName: 'Library Management System',
                applicationVersion: '0.1.1',
                applicationIcon: Icon(
                  Icons.alarm,
                  size: 40.0,
                  color: Colors.lightBlue,
                ),
                applicationLegalese:
                    'App created by Lukas Wobak, Thomas Wobak and Yevhen Makarov',
              );
            },
          ),
        ],
      ),
    );
  }

  static AppBar standartAppBar(BuildContext context) {
    return AppBar(
        title: const Text(''),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/shelf');
                },
                child: Text(
                  "Shelves",
                  style: Design.smallLetterYellow(),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/booklist');
                },
                child: Text(
                  "Books",
                  style: Design.smallLetterYellow(),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/bookdetails');
                },
                child: Text(
                  "Bookdetails",
                  style: Design.smallLetterYellow(),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 50,
          )

          /*TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text(
              "Login",
              style: Design.smallLetterYellow(),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/bookdetails');
            },
            child: Text(
              "details",
              style: Design.smallLetterYellow(),
            ),
          ),*/
        ]);
  }
}
