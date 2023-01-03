import 'package:flutter/material.dart';

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

  static TextStyle bigLetters() {
    return TextStyle(
      fontSize: 24.0,
      letterSpacing: 1.0,
    );
  }

  static AppBar standartAppBar(BuildContext context) {
    return AppBar(title: const Text(''), actions: <Widget>[
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
      ),
      IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            //TODO add settings page (:
          })
    ]);
  }
}
