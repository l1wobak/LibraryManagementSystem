import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_management_system/Objects/user.dart';

/*
{
    "_id": 14,
    "title": "Coffeehouse",
    "isbn": "1884777384",
    "pageCount": 316,
    "publishedDate": {
        "$date": "1997-07-01T00:00:00.000-0700"
    },
    "thumbnailUrl": "https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/asher.jpg",
    "shortDescription": "Coffeehouse is an anthology of stories, poems and essays originally published on the World Wide Web.",
    "longDescription": "Coffeehouse is an anthology of stories, poems and essays originally published on the World Wide Web. The purpose is to capture the zeitgeist of the web's creative community, and to give readers a chance to enjoy some of the best and most notable original works that have appeared in this form. It showcases over forty individual web writers, among them Joseph Squier, Martha Conway, Jason Snell, David Alexander, Carl Steadman and Walter Miller. The intent is to show the variety and vitality of the web's blossoming literary \"scene,\" and to capture the unique and highly iconoclastic \"personality\" of the web community.",
    "status": "PUBLISH",
    "authors": ["Levi Asher", "Christian Crumlish"],
    "categories": ["Miscellaneous"]
} */
class Book {
  int id;
  int pagecount;
  String title;
  String isbn;
  String thumbnailUrl;
  String shortDescribtion;
  String longDescription;
  String status;
  String location;
  DateTime publishedDate;
  List<dynamic> authors;
  List<dynamic> categories;
  bool available;
  User user;

  Book(
      this.id,
      this.pagecount,
      this.title,
      this.isbn,
      this.thumbnailUrl,
      this.shortDescribtion,
      this.longDescription,
      this.status,
      this.location,
      this.publishedDate,
      this.authors,
      this.categories,
      this.available);

  Book.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.pagecount = json["pageCount"];
    this.title = json["title"];
    this.isbn = json["isbn"];
    this.thumbnailUrl = json["thumbnailUrl"];
    this.shortDescribtion = json["shortDescribtion"];
    this.longDescription = json["longDescription"];
    this.status = json["status"];
    String date = json["publishedDate"];
    if (date != null && date.length > 19) {
      date = date.toString().substring(0, 19);
      this.publishedDate = DateFormat("yyyy-MM-ddTHH:mm:ss").parseStrict(date);
    }
    this.authors = json["authors"];
    this.categories = json["categories"];
    this.available = true;
  }

  int get getId => this.id;

  set setId(int id) => this.id = id;

  get getPagecount => this.pagecount;

  String get getLocation => this.location;

  set setLocation(String location) => this.location = location;

  set setPagecount(pagecount) => this.pagecount = pagecount;

  get getTitle => this.title;

  set setTitle(title) => this.title = title;

  get getIsbn => this.isbn;

  set setIsbn(isbn) => this.isbn = isbn;

  get getThumbnailUrl => this.thumbnailUrl;

  set setThumbnailUrl(thumbnailUrl) => this.thumbnailUrl = thumbnailUrl;

  get getShortDescribtion => this.shortDescribtion;

  set setShortDescribtion(shortDescribtion) =>
      this.shortDescribtion = shortDescribtion;

  get getLongDescription => this.longDescription;

  set setLongDescription(longDescription) =>
      this.longDescription = longDescription;

  get getStatus => this.status;

  set setStatus(status) => this.status = status;

  get getPublishedDate => this.publishedDate;

  set setPublishedDate(publishedDate) => this.publishedDate = publishedDate;

  get getAuthors => this.authors;

  set setAuthors(authors) => this.authors = authors;

  get getCategories => this.categories;

  set setCategories(categories) => this.categories = categories;

  bool get getAvailable => this.available;

  set setAvailable(bool available) => this.available = available;

  get getUser => this.user;

  void setUser(User userlist) {
    this.user = userlist;
  }
}
