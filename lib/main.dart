import 'package:flutter/material.dart';
import 'package:library_management_system/Screens/all_users_list.dart';
import 'package:library_management_system/Services/barcodeScanner.dart';
import 'Screens/forgot_password_screen.dart';
import 'Screens/book_details.dart';
import 'Screens/booklist_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/shelf_screen.dart';
import 'Screens/signup_screen.dart';

void main() {
  // needed if you initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Shelf(),
      '/shelf': (context) => Shelf(),
      '/booklist': (context) => Booklist(),
      '/login': (context) => Login(),
      '/signup': (context) => Signup(),
      '/forgotpassword': (context) => ForgotPassword(),
      '/bookdetails': (context) => BookDetails(),
      '/barcodescanner': (context) => BarcodeScanner(),
      '/alluserlist': (context) => AllUserList(),
      '0': (context) => Shelf(),
      '1': (context) => Booklist(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
