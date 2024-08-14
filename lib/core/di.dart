import 'package:flutter_article_app/domain/usecases/get_articles.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_article_app/data/repositories/article_repository_impl.dart';
import 'package:flutter_article_app/domain/repositories/article_repository.dart';
import 'package:flutter_article_app/presentation/blocs/article_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => ArticleBloc(getArticles: sl()));

  sl.registerLazySingleton(() => GetArticles(sl()));

  sl.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(client: sl()),
  );

  sl.registerLazySingleton(() => http.Client());
}
