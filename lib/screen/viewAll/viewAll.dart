// ignore_for_file: must_be_immutable, file_names, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/category/articleModel.dart';
import '../../models/list/sliderModel.dart';
import '../../services/news.dart';
import '../../services/slider_data.dart';
import '../articleView/articleView.dart';

class AllNews extends StatefulWidget {
  String news;
  AllNews({super.key, required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];

  @override
  void initState() {
    getSliders();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
  }

  getSliders() async {
    Sliders slider = Sliders();
    await slider.getSliders();
    sliders = slider.sliders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("${widget.news}News", style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: widget.news== "Breaking"? sliders.length : articles.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return AllNewsSection(
              Image: widget.news== "Breaking"? sliders[index].urlToImage!: articles[index].urlToImage!,
              desc: widget.news== "Breaking"? sliders[index].description!: articles[index].description!,
              title: widget.news== "Breaking"? sliders[index].title!: articles[index].title!,
              url: widget.news== "Breaking"? sliders[index].url!: articles[index].url!,
            );
          },
        ),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  String Image, desc, title, url;
  AllNewsSection(
      {super.key,
      required this.Image,
      required this.desc,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      trendUrl: url,
                    )));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
                imageUrl: Image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200),
          ),
          const SizedBox(height: 10.0),
          Text(title,
              maxLines: 2,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(desc,
              maxLines: 3,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
