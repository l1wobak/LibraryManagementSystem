import 'package:flutter/material.dart';
import 'package:library_management_system/Services/design.dart';
import 'package:library_management_system/Services/methods.dart';
import 'package:filter_list/filter_list.dart';
import '../Objects/book.dart';
import '../Objects/bookCard.dart';

class Booklist extends StatefulWidget {
  @override
  _BooklistState createState() => _BooklistState();
}

Methods methods = new Methods();
Map routeData = {};
List<Book> allBooks = (routeData['booklist'] != null)
    ? routeData['booklist']
    : methods.getBooklist();
List<Book> foundBooks = [];
String searchText = '';

/**
 * TODO
 * DONEAdd search and filter function
 *DONE Add location information
 * Add some admin function
 * Add info where user came from
 *DONE Can be accessed by clicking "my books" with a booklist being given through modalroute (is then called 'booklist') 
 * If so then all books are borrowed and it would be clean to have a 1 button return option
 * can be accessed with a filter for a shelf (is then called 'shelf' in modalroute)
 * Both can also be null
 * 
 * when going to a new page always give methods with you so all pages always have the same methods object
 * methods.getcurrentuser.getIsAdmin gives if a user is admin, it can aslo be null tho
 */
class _BooklistState extends State<Booklist> {
  List<String> allCategories = methods.getAllCategories();

  List<String> selectedCategoriesList = [null];
  @override
  void initState() {
    foundBooks = allBooks;
    super.initState();
  }

  void runFilter(String enteredWord) {
    enteredWord = enteredWord.toLowerCase();

    List<Book> results = [];

    if (enteredWord.isEmpty &&
        (selectedCategoriesList == allCategories ||
            selectedCategoriesList.isEmpty ||
            selectedCategoriesList[0] == null)) {
      results = allBooks;
    } else {
      results = allBooks
          .where((book) =>
              (book.title.toLowerCase().contains(enteredWord.toLowerCase()) ||
                  book.authors.toString().contains(enteredWord.toLowerCase())))
          .toList();
      if (!(selectedCategoriesList == allCategories ||
          selectedCategoriesList.isEmpty ||
          selectedCategoriesList[0] == null)) {
        results = results
            .where((book) =>
                selectedCategoriesList
                    .toString()
                    .contains(book.getCategories.toString().toLowerCase()) ||
                selectedCategoriesList.toString().toLowerCase().contains(
                    "shelf " + book.getLocation.toLowerCase().split(";")[0]))
            .toList();
      }
    }

    setState(() {
      foundBooks = results;
      searchText = enteredWord;

      if (routeData['shelf'] != null) {
        routeData['shelf'] = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    routeData = ModalRoute.of(context).settings.arguments;
    methods = routeData['methods'];
    String routeShelf =
        (routeData['shelf'] != null) ? "shelf " + routeData['shelf'] : null;
    selectedCategoriesList =
        (routeData['shelf'] != null) ? [routeShelf] : selectedCategoriesList;
    runFilter(searchText);

    allBooks = (routeData['booklist'] != null)
        ? routeData['booklist']
        : methods.getBooklist();

    String filter = "No filters selected";
    if (!(selectedCategoriesList.isEmpty ||
        selectedCategoriesList[0] == null)) {
      filter = "Selected Filters: " +
          selectedCategoriesList
              .toString()
              .replaceAll("[", "")
              .replaceAll("]", "");
    }
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        new GlobalKey<RefreshIndicatorState>();

    Drawer drawer = (methods.getCurrentUser() != null &&
            methods.getCurrentUser().getIsAdmin)
        ? Design.adminDrawer(context, methods)
        : Design.standartDrawer(context, methods);

    return Scaffold(
      appBar: Design.standartAppBar(context, methods),
      drawer: drawer,
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: searchText,
                onFieldSubmitted: ((value) => runFilter(value)),
                decoration: InputDecoration(
                    labelText: 'search', suffixIcon: Icon(Icons.search)),
              ),
              ElevatedButton(
                  onPressed: () async {
                    showFilters();
                  },
                  child: Icon(Icons.filter_alt)),
              Text(filter,
                  overflow: TextOverflow.ellipsis, softWrap: true, maxLines: 5),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 16.0),
                  color: Colors.white10,
                  //The Listviewbuilder needs a list and can build a unique Card for each item in the list.
                  child: ListView.builder(
                    itemCount: foundBooks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BookCard(book: foundBooks[index], m: methods);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() {}

  Future<void> showFilters() async {
    List<String> list = new List<String>();
    FilterListDialog.display<String>(
      context,
      listData: allCategories,
      selectedListData: list,
      choiceChipLabel: (category) => category,
      validateSelectedItem: (list, val) {
        if (list != null) return list.contains(val);
        return false;
      },
      onItemSearch: (category, query) {
        return;
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedCategoriesList = List.from(list);
        });
        runFilter(searchText);
        Future.delayed(Duration.zero, () {
          Navigator.pop(context);
        });
      },
    );
  }
}
