part of 'remote_article_bloc.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? article;
  final DioException? error;
  const RemoteArticleState({this.article, this.error});

  @override
  List<Object> get props => [article!, error!];
}

class RemoteArticleInitial extends RemoteArticleState {
  const RemoteArticleInitial();
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> articles)
      : super(article: articles);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException error) : super(error: error);
}
