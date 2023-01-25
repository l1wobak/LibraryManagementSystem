import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:library_management_system/Screens/booklist_screen.dart';
import 'package:library_management_system/Screens/login_screen.dart';
import 'package:library_management_system/Screens/shelf_screen.dart';
import 'package:library_management_system/Services/barcodeScanner.dart';

import 'methods.dart';

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

  static Future<String> tryScan() async {
    String barcodeScanRes;
  }

  static Drawer adminDrawer(BuildContext context, Methods m) {
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
              Navigator.pushNamed(context, '/booklist',
                  arguments: {'methods': m});
            },
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Scan Barcode'),
            onTap: () {
              scanBarcodeNormal(m, context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('See all users'),
            onTap: () {
              Navigator.pushNamed(context, '/alluserlist',
                  arguments: {'methods': m});
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login',
                  arguments: {'methods': m});
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

  static Drawer standartDrawer(BuildContext context, Methods m) {
    String logintext =
        (m.getCurrentUser() != null) ? "Logout" : "Login / Signup";
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
              Navigator.pushNamed(context, '/booklist',
                  arguments: {'methods': m});
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text(logintext),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login',
                  arguments: {'methods': m});
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

  static AppBar standartAppBar(BuildContext context, Methods m) {
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
                  Navigator.pushNamed(context, '/shelf',
                      arguments: {'methods': m});
                },
                child: Text(
                  "Shelves",
                  style: Design.smallLetterYellow(),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/booklist',
                      arguments: {'methods': m});
                },
                child: Text(
                  "Books",
                  style: Design.smallLetterYellow(),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
          )
        ]);
  }

  static Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  static Future<void> scanBarcodeNormal(Methods m, BuildContext context) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (barcodeScanRes != "-1") {
      Navigator.pushNamed(context, '/bookdetails',
          arguments: {"methods": m, "bookid": barcodeScanRes});
    }
  }
}
