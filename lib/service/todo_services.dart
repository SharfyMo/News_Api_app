import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api_pro/model/todo.dart';
import 'package:news_api_pro/model/todos_model.dart';

class TodoService {
  final String keyapi = '62f2a68cdb9e4c3eab9c01a5a8a27361';

  getAll() async {
    const url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=62f2a68cdb9e4c3eab9c01a5a8a27361";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Articles todoo = Articles.fromjson(json);
      List<Todo> todos = todoo.articles.map((e) => Todo.fromJson(e)).toList();
      return todos;
    }
    return [];
  }
}

// fetching news by  category
class CategoryNews {
  // List<Todo> datatobesavedin = [];

  getNews(String category) async {
    var url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=62f2a68cdb9e4c3eab9c01a5a8a27361";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Articles todoo = Articles.fromjson(json);
      List<Todo> todos = todoo.articles.map((e) => Todo.fromJson(e)).toList();
      return todos;
    }
    return [];
  }
}
