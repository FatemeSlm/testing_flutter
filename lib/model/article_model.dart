class ArticleModel {
  final String title;
  final String content;

  ArticleModel({
    required this.title,
    required this.content,
  });

  ArticleModel copyWith({
    String? title,
    String? content,
  }) {
    return ArticleModel(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  String toString() => 'Article(title: $title, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArticleModel && other.title == title && other.content == content;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}