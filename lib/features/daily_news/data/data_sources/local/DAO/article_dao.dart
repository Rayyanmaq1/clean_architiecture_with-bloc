import 'package:floor/floor.dart';
import 'package:flutter_bloc_api/features/daily_news/data/models/article_model.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel articleModel);
  @delete
  Future<void> deleteArticle(ArticleModel articleModel);
  @Query('Select * From article')
  Future<List<ArticleModel>> getArticles();
}
