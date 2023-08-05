import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;
  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [];
}

class GetLocalArticle extends LocalArticleEvent {
  const GetLocalArticle();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArticleEntity article) : super(article: article);
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArticleEntity article) : super(article: article);
}
