import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:flutter_article_app/data/repositories/article_repository_impl.dart';
import 'package:flutter_article_app/domain/entities/article.dart';
import 'dart:convert';

class MockClient extends Mock implements http.Client {}

void main() {
  late ArticleRepositoryImpl articleRepository;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    articleRepository = ArticleRepositoryImpl(client: mockClient);
  });

  group('ArticleRepositoryImpl', () {
    test('returns a list of articles when the http call completes successfully',
        () async {
      // Simula una respuesta exitosa
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
          .thenAnswer((_) async => http.Response(
              jsonEncode([
                {"id": 1, "title": "Article 1", "body": "Body of Article 1"},
                {"id": 2, "title": "Article 2", "body": "Body of Article 2"}
              ]),
              200));

      final articles = await articleRepository.getArticles();
      expect(articles, isA<List<Article>>());
      expect(articles.length, 2);
    });

    test('throws an exception when the http call completes with an error',
        () async {
      // Simula una respuesta con error
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => articleRepository.getArticles(), throwsException);
    });
  });
}
