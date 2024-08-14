import 'package:flutter/material.dart';
import 'package:flutter_article_app/presentation/utils/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_article_app/presentation/blocs/article_bloc.dart';
import '../core/di.dart' as di;
import 'package:flutter_article_app/presentation/pages/article_list_page.dart';
import 'package:flutter_article_app/core/theme_notifier.dart';

void main() {
  di.init();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(lightTheme),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Flutter Articles',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      home: BlocProvider(
        create: (_) => di.sl<ArticleBloc>()..add(LoadArticles()),
        child: const ArticleListPage(),
      ),
    );
  }
}
