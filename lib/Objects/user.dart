import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'book.dart';

class User {
  String username;
  String password;
  String email;
  String phoneNumber;
  bool isAdmin;
  List<Book> borrowedbooks;
  

  User(this.username, this.password, this.isAdmin, this.borrowedbooks,
      this.email, this.phoneNumber);

  String get getUsername => this.username;
  get getEmail => this.email;

  set setEmail(email) => this.email = email;

  get getPhoneNumber => this.phoneNumber;

  set setPhoneNumber(phoneNumber) => this.phoneNumber = phoneNumber;
  set setUsername(String username) => this.username = username;

  get getPassword => this.password;

  set setPassword(password) => this.password = password;

  get getIsAdmin => this.isAdmin;

  set setIsAdmin(isAdmin) => this.isAdmin = isAdmin;

  get getBorrowedbooks => this.borrowedbooks;

  set setBorrowedbooks(borrowedbooks) => this.borrowedbooks = borrowedbooks;
}
