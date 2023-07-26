import 'package:flutter/material.dart';
import 'package:news_api_pro/model/todo.dart';
import 'package:news_api_pro/service/todo_services.dart';

class CategoryProvider extends ChangeNotifier {
  final _service = CategoryNews();
  bool isloading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  getAllCategory(String category) async {
    isloading = true;
    notifyListeners();
    final response = await _service.getNews(category);
    _todos = response;
    isloading = false;
    notifyListeners();
  }
}
