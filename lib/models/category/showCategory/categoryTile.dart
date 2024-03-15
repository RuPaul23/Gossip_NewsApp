// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';

import '../../../screen/categoryNews/categoryNews.dart';

class CategoryTile extends StatelessWidget {
  final image, categoryName;

  const CategoryTile({super.key, this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(name: categoryName)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: 
              Image.asset(image, width:120, height: 60, fit: BoxFit.cover)
              ),
              Container(
                width: 120, height: 60,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10), 
                ),
                child: Center(
                  child: Text(categoryName, 
                          style: const TextStyle(color: Colors.yellowAccent, fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
