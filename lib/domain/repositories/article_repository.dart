abstract class ArticleRepository {
  Future<List<Article>> getArticles();
  Future<Article> getArticle(int id);
}
