import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_api_pro/model/categorymodel.dart';
import 'package:news_api_pro/provider/todo_provider.dart';
import 'package:news_api_pro/screens/widgets/app_bar_home.dart';
import 'package:news_api_pro/screens/widgets/categorytile_listview.dart';
import 'package:news_api_pro/screens/widgets/newstemplate_listview.dart';
import 'package:news_api_pro/service/categorydata.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // get our categories list
  List<CategoryModel>? categories;

  bool _loading = true;
  bool _newsloading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });

    setState(() {
      _loading = false;
      _newsloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const AppBarHome()),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: _loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        CategorytileListView(
                          categories: categories,
                        ),
                        _newsloading
                            ? const SpinKitFadingCircle(
                                color: Color.fromARGB(146, 12, 16, 49),
                                size: 160.0,
                              )
                            : const NewsListview(),
                      ],
                    ),
                  ),
          ),
        ]));
  }
}
