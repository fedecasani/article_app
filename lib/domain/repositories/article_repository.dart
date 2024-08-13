import 'package:flutter_article_app/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> getArticles();
  Future<Article> getArticle(int id);
}
