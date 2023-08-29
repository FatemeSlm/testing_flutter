import 'package:flutter/material.dart';

import '../../model/article_model.dart';

class ArticleScreen extends StatelessWidget {
  final ArticleModel article;

  const ArticleScreen({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: mq.padding.top,
          bottom: mq.padding.bottom,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            Text(
              article.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 8),
            Text(article.content),
          ],
        ),
      ),
    );
  }
}