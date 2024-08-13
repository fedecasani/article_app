import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'data/repositories/article_repository_impl.dart';
import 'domain/repositories/article_repository.dart';

final sl = GetIt.instance;

void init() {
  // BloC

  // Usecases
  sl.registerLazySingleton(() => GetArticles(sl()));

  // Repository
  sl.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
}
