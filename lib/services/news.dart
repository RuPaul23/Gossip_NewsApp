import 'dart:convert';

import 'package:news_app/models/category/articleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/everything?q=tesla&from=2024-02-15&sortBy=publishedAt&apiKey=f6d798e2fa9b478096d11fed209f1d3f";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
