import 'package:flutter_bloc_api/core/usecases/usecase.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;
  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
