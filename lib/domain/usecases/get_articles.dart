import 'package:flutter_article_app/domain/entities/article.dart';
import 'package:flutter_article_app/domain/repositories/article_repository.dart';

class GetArticles {
  final ArticleRepository repository;

  GetArticles(this.repository);

  Future<List<Article>> call() async {
    return await repository.getArticles();
  }
}
