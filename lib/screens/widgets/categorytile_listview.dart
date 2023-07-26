import 'package:flutter/material.dart';
import 'package:news_api_pro/model/categorymodel.dart';
import 'package:news_api_pro/screens/function/category_tile.dart';

class CategorytileListView extends StatelessWidget {
  CategorytileListView({super.key, required this.categories});
  List<CategoryModel>? categories;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: categories!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    imageUrl: categories![index].imageUrl,
                    categoryName: categories![index].categoryName,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
