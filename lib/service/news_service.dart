import 'package:flutter_lorem/flutter_lorem.dart';
import '../model/article_model.dart';

/// A News service simulating communication with a server.
class NewsService {
  // Simulating a remote database
  final _articles = List.generate(
    10,
    (_) => ArticleModel(
      title: lorem(paragraphs: 1, words: 3),
      content: lorem(paragraphs: 10, words: 500),
    ),
  );

  Future<List<ArticleModel>> getArticles() async {
    await Future.delayed(const Duration(seconds: 1));
    return _articles;
  }
}
