// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class ArticleView extends StatefulWidget {
  String trendUrl;
  ArticleView({super.key, required this.trendUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gossip"),
            Text("News", style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.save),
            ),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: WebView(
        initialUrl: widget.trendUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
