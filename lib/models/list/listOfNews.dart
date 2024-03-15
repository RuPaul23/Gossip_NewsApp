// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/category/showCategory/categoryModel.dart';
import 'package:news_app/models/category/showCategory/categoryTile.dart';

class ListOfNews extends StatelessWidget {
  const ListOfNews({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 70.0,
            child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length, 
            itemBuilder: (context, index){
            return CategoryTile(
            image: categories[index].image,
            categoryName: categories[index].categoryName,
            );
          }
          ),
        ),
      ],
    );
  }
}