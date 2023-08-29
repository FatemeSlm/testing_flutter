import 'package:flutter/material.dart';
import '../../model/article_model.dart';
import '../../service/news_service.dart';

class NewsChangeNotifier extends ChangeNotifier {
  final NewsService _newsService;

  NewsChangeNotifier(this._newsService);

  List<ArticleModel> _articles = [];

  List<ArticleModel> get articles => _articles;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getArticles() async {
    // TODO: Implement
  }
}