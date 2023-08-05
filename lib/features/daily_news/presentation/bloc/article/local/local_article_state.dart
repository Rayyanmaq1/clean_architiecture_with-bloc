import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntity>? article;
  const LocalArticleState({this.article});

  @override
  List<Object> get props => [];
}

class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading();
}

class LocalArticleDone extends LocalArticleState {
  const LocalArticleDone(List<ArticleEntity> articles)
      : super(article: articles);
}
