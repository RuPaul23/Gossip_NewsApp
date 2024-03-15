import 'package:flutter/material.dart';
import 'package:news_app/screen/viewAll/viewAll.dart';

class CustomSectionHeading extends StatelessWidget {
  const CustomSectionHeading({
    super.key, 
    this.textColor, 
    required this.title, 
    this.buttonTitle ='View all', 
    this.showActionButton = false, 
    this.onPressed,
  });

  final Color? textColor;
  final String title, buttonTitle;
  final bool showActionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 20.0),
          maxLines: 1,
          overflow: TextOverflow.ellipsis),
      if (showActionButton) TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AllNews( news: "Breaking",)));}, 
      child: Text(
        buttonTitle, 
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: textColor, fontSize: 13.0, fontWeight: FontWeight.bold)))
    ]);
  }
}
