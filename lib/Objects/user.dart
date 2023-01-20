import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'book.dart';

class User {
  String username;
  String password;
  bool isAdmin;
  List<Book> borrowedbooks;
  String get getUsername => this.username;
  User(this.username, this.password, this.isAdmin, this.borrowedbooks);
  set setUsername(String username) => this.username = username;

  get getPassword => this.password;

  set setPassword(password) => this.password = password;

  get getIsAdmin => this.isAdmin;

  set setIsAdmin(isAdmin) => this.isAdmin = isAdmin;

  get getBorrowedbooks => this.borrowedbooks;

  set setBorrowedbooks(borrowedbooks) => this.borrowedbooks = borrowedbooks;
}
