// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_sizes/custom_sizes.dart';

import '../../screen/articleView/articleView.dart';

// ignore: must_be_immutable
class TrendingNewsList extends StatelessWidget {

  String imageUrl, title, desc, url;

  TrendingNewsList({super.key, required this.imageUrl, required this.title, required this.desc, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(trendUrl: url)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: CustomSizes.spaceBtwItems),
        child: Material(
          elevation: 1.0,
          color: Colors.yellow[100],
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:  CachedNetworkImage( height: 100, width: 100, fit: BoxFit.fill, imageUrl: imageUrl)),
                ),
                const SizedBox(width: CustomSizes.spaceBtwItems),
          
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width /1.7,
                      child: Text(title, maxLines: 2, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(width: CustomSizes.spaceBtwItems),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /1.7,
                      child: Text(desc,maxLines: 2, style: const TextStyle(color:Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                    
                  ],
                ),
                        
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

