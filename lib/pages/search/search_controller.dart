import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:curso/models/to_do_model.dart';
import 'dart:developer' as developer;

class SearchController with ChangeNotifier {

  List<ToDo> todos = [];

  SearchController() {
    refreshToDoList();
  }

  void refreshToDoList() {
    http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos"),
    ).then((response) {
      if (response.statusCode == 200) {
        todos = [];
        for (dynamic todo in json.decode(response.body)) {
          todos.add(ToDo.fromJson(todo));
        }
      }
      notifyListeners();
    });
  }

}