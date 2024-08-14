part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Article> articles;

  const ArticleLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class ArticleError extends ArticleState {
  final String message;

  const ArticleError(this.message);

  @override
  List<Object> get props => [message];
}
