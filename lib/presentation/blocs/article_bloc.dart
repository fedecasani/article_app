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
        emit(ArticleError("Error al cargar artículos"));
      }
    });
  }
}

part 'article_event.dart':
abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class LoadArticles extends ArticleEvent {}

part 'article_state.dart':
abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Article> articles;

  ArticleLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class ArticleError extends ArticleState {
  final String message;

  ArticleError(this.message);

  @override
  List<Object> get props => [message];
}
