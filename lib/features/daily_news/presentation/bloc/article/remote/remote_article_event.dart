part of 'remote_article_bloc.dart';

abstract class RemoteArticleEvent {
  const RemoteArticleEvent();
}

class GetArticle extends RemoteArticleEvent {
  const GetArticle();
}
