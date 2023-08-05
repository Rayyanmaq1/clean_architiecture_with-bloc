import 'package:flutter_bloc_api/core/resources/data_state.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
  Future<List<ArticleEntity>> getSavedArticles();
  Future<void> saveArticles(ArticleEntity articleEntity);
  Future<void> removeArticle(ArticleEntity articleEntity);
}
