// ignore_for_file: must_be_immutable, non_constant_identifier_names, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/articleView/articleView.dart';

class ShowCategory extends StatelessWidget {
  String Image, desc, title, url;
  ShowCategory({super.key, required this.Image, required this.desc, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(trendUrl: url,)));
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
