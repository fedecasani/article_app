import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_article_app/presentation/blocs/article_bloc.dart';
import '../core/di.dart' as di;
import 'package:flutter_article_app/presentation/pages/article_list_page.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Articles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => di.sl<ArticleBloc>()..add(LoadArticles()),
        child: ArticleListPage(),
      ),
    );
  }
}
