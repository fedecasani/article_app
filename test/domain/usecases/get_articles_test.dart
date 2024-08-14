import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_article_app/domain/usecases/get_articles.dart';
import 'package:flutter_article_app/domain/repositories/article_repository.dart';
import 'package:flutter_article_app/domain/entities/article.dart';

class MockArticleRepository extends Mock implements ArticleRepository {}

void main() {
  late GetArticles getArticles;
  late MockArticleRepository mockArticleRepository;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
    getArticles = GetArticles(mockArticleRepository);
  });

  group('GetArticles', () {
    test('should return a list of articles when the repository returns data',
        () async {
      final articles = [const Article(id: 1, title: 'Title', body: 'Body')];
      when(mockArticleRepository.getArticles())
          .thenAnswer((_) async => articles);

      final result = await getArticles();
      expect(result, articles);
    });

    test('should throw an exception when the repository throws an error',
        () async {
      when(mockArticleRepository.getArticles()).thenThrow(Exception('Error'));

      expect(() => getArticles(), throwsException);
    });
  });
}
