import 'package:flutter_bloc_api/core/usecases/usecase.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;
  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
