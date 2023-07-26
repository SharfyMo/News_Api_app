import 'package:flutter/material.dart';
import 'package:news_api_pro/provider/category_provider.dart';
import 'package:news_api_pro/provider/todo_provider.dart';
import 'package:news_api_pro/screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => TodoProvider(),
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TodoProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return CategoryProvider();
        }),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
