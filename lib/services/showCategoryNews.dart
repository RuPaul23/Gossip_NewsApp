// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/category/showCategory/showCategoryModel.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];


  get urlToImage => null;
  Future<void> getCategoriesNews(String category) async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f6d798e2fa9b478096d11fed209f1d3f";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ShowCategoryModel categoryModel = ShowCategoryModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            author: element['author'],
          );
          categories.add(categoryModel);
        }
      });
    }
  }
}
