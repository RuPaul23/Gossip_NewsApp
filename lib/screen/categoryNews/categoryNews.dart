// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:news_app/models/category/showCategory/showCategoryModel.dart';
import 'package:news_app/services/showCategoryNews.dart';

import '../../models/category/showCategory/showCategory.dart';

class CategoryNews extends StatefulWidget {
  String name;
  CategoryNews({super.key, required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(widget.name, style: const TextStyle(color: Colors.black)),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: GestureDetector(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: categories.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ShowCategory(
                  Image: categories[index].urlToImage!,
                  desc: categories[index].description!,
                  title: categories[index].title!,
                  url: categories[index].url!,
                );
              },
            ),
          ),
        ));
  }
}

