import 'package:flutter/material.dart';
import 'Screens/book_details.dart';
import 'Screens/booklist_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/shelf_screen.dart';

void main() {
  // needed if you initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/shelf': (context) => Shelf(),
      '/booklist': (context) => Booklist(),
      '/login': (context) => Login(),
      '/bookdetails': (context) => BookDetails(),
      '0': (context) => Shelf(),
      '1': (context) => Booklist(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
