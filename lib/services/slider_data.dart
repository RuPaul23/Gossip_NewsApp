import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/list/sliderModel.dart';

class Sliders {
  List<SliderModel> sliders = [];
  Future<void> getSliders() async {
    String url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f6d798e2fa9b478096d11fed209f1d3f";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          SliderModel sliderModel = SliderModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          sliders.add(sliderModel);
        }
      });
    }
  }
}
