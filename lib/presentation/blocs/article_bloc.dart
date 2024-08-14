// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/article.dart';
import '../../domain/usecases/get_articles.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticles getArticles;

  ArticleBloc({required this.getArticles}) : super(ArticleLoading()) {
    on<LoadArticles>((event, emit) async {
      emit(ArticleLoading());
      try {
        final articles = await getArticles();
        emit(ArticleLoaded(articles));
      } catch (_) {
        emit(const ArticleError("Error loading articles"));
      }
    });
  }
}
