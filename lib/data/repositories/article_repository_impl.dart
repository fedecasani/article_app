import 'dart:convert';

import 'package:flutter_article_app/domain/entities/article.dart';
import 'package:flutter_article_app/domain/repositories/article_repository.dart';
import 'package:http/http.dart' as http;

class ArticleRepositoryImpl implements ArticleRepository {
  final http.Client client;

  ArticleRepositoryImpl({required this.client});

  @override
  Future<List<Article>> getArticles() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Article.fromJson(json)).toList();
  }

  @override
  Future<Article> getArticle(int id) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    return Article.fromJson(json.decode(response.body));
  }
}
