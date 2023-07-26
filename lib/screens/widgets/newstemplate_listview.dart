import 'package:flutter/material.dart';
import 'package:news_api_pro/provider/todo_provider.dart';
import 'package:news_api_pro/screens/function/news_template.dart';
import 'package:provider/provider.dart';

class NewsListview extends StatelessWidget {
  const NewsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, value, child) {
        final todos = value.todos;
        return ListView.builder(
            itemCount: todos.length,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return NewsTemplate(
                title: todo.title,
                description: todo.description,
                urlToImage: todo.urlToImage,
                url: todo.url,
              );
            });
      },
    );
  }
}
