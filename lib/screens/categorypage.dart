import 'package:flutter/material.dart';
import 'package:news_api_pro/screens/function/news_template.dart';
import 'package:provider/provider.dart';
import '../provider/category_provider.dart';

class CategoryFragment extends StatefulWidget {
  String category;
  CategoryFragment({super.key, required this.category});
  @override
  _CategoryFragmentState createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryProvider>(context, listen: false)
          .getAllCategory(widget.category.toLowerCase());
    });

    setState(() {
      // important method otherwise you would have to perform hot relod always
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .center, // this is to bring the row text in center
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                widget.category.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),

      // category widgets
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Consumer<CategoryProvider>(
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
              ),
            ),
    );
  }
}
