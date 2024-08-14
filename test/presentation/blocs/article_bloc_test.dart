import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_article_app/presentation/blocs/article_bloc.dart';
import 'package:flutter_article_app/domain/entities/article.dart';
import 'package:flutter_article_app/domain/usecases/get_articles.dart';

class MockGetArticles extends Mock implements GetArticles {}

void main() {
  late ArticleBloc articleBloc;
  late MockGetArticles mockGetArticles;

  setUp(() {
    mockGetArticles = MockGetArticles();
    articleBloc = ArticleBloc(getArticles: mockGetArticles);
  });

  group('ArticleBloc', () {
    test('initial state should be ArticleLoading', () {
      expect(articleBloc.state, ArticleLoading());
    });

    blocTest<ArticleBloc, ArticleState>(
      'emits [ArticleLoading, ArticleLoaded] when articles are fetched successfully',
      build: () {
        when(mockGetArticles()).thenAnswer(
            (_) async => [const Article(id: 1, title: 'Title', body: 'Body')]);
        return articleBloc;
      },
      act: (bloc) => bloc.add(LoadArticles()),
      expect: () => [
        ArticleLoading(),
        const ArticleLoaded([Article(id: 1, title: 'Title', body: 'Body')])
      ],
    );

    blocTest<ArticleBloc, ArticleState>(
      'emits [ArticleLoading, ArticleError] when fetching articles fails',
      build: () {
        when(mockGetArticles()).thenThrow(Exception('Error'));
        return articleBloc;
      },
      act: (bloc) => bloc.add(LoadArticles()),
      expect: () =>
          [ArticleLoading(), const ArticleError("Error loading articles")],
    );
  });
}
