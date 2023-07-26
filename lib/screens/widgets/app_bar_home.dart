import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Flutter ",
          style: TextStyle(color: Colors.black),
        ),
        Text(
          "News",
          style: TextStyle(color: Colors.blueAccent),
        ),
      ],
    );
  }
}
