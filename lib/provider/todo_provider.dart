import 'package:flutter/material.dart';
import 'package:news_api_pro/model/todo.dart';
import 'package:news_api_pro/service/todo_services.dart';

class TodoProvider extends ChangeNotifier {
  final _service = TodoService();
  bool isloading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  getAllTodos() async {
    isloading = true;
    notifyListeners();
    final response = await _service.getAll();
    _todos = response;
    isloading = false;
    notifyListeners();
  }
}
