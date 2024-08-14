import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_article_app/presentation/pages/article_detail_page.dart';
import 'package:flutter_article_app/domain/entities/article.dart';

void main() {
  testWidgets('shows article details correctly', (WidgetTester tester) async {
    final article =
        Article(id: 1, title: 'Article Title', body: 'Article Body');

    await tester.pumpWidget(MaterialApp(
      home: ArticleDetailPage(article: article),
    ));

    expect(find.text('Article Title'), findsOneWidget);
    expect(find.text('Article Body'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
