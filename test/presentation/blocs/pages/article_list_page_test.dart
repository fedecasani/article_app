import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_article_app/presentation/pages/article_list_page.dart';
import 'package:flutter_article_app/presentation/blocs/article_bloc.dart';
import 'package:flutter_article_app/domain/entities/article.dart';

class MockArticleBloc extends Mock implements ArticleBloc {}

void main() {
  late MockArticleBloc mockArticleBloc;

  setUp(() {
    mockArticleBloc = MockArticleBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<ArticleBloc>(
        create: (context) => mockArticleBloc,
        child: ArticleListPage(),
      ),
    );
  }

  testWidgets('shows loading indicator when articles are loading',
      (WidgetTester tester) async {
    when(mockArticleBloc.state).thenReturn(ArticleLoading());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows articles when loaded successfully',
      (WidgetTester tester) async {
    when(mockArticleBloc.state).thenReturn(ArticleLoaded([
      Article(id: 1, title: 'Title 1', body: 'Body 1'),
      Article(id: 2, title: 'Title 2', body: 'Body 2')
    ]));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Title 1'), findsOneWidget);
    expect(find.text('Title 2'), findsOneWidget);
  });

  testWidgets('shows error message when loading fails',
      (WidgetTester tester) async {
    when(mockArticleBloc.state).thenReturn(ArticleError('Error'));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Error'), findsOneWidget);
  });
}
