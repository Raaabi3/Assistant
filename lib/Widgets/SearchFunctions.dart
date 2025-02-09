import 'package:flutter/material.dart';

class SearchFunctions {
  final TextEditingController searchController = TextEditingController();
  String? selectedFilter;

  void performSearch([String? value]) {
    String query = searchController.text.trim();
    if (query.isNotEmpty) {
      print("Searching for: $query");
    }
  }

  void showFilterMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 10, 0),
      items: [
        PopupMenuItem(value: 'Newest', child: Text('Newest')),
        PopupMenuItem(value: 'Relevance', child: Text('Relevance')),
        PopupMenuItem(value: 'Salary', child: Text('Highest Salary')),
      ],
    ).then((value) {
      if (value != null) {
        selectedFilter = value;
        print("Selected Filter: $selectedFilter");
      }
    });
  }
}
