class GetArticles {
  final ArticleRepository repository;

  GetArticles(this.repository);

  Future<List<Article>> call() async {
    return await repository.getArticles();
  }
}
