import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  LocalArticleBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const LocalArticleLoading()) {
    on<GetLocalArticle>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticles);
    on<SaveArticle>(onSaveArticles);
  }

  void onGetSavedArticles(
      GetLocalArticle event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onSaveArticles(
    SaveArticle saveEvent,
    Emitter<LocalArticleState> emit,
  ) async {
    await _saveArticleUseCase(params: saveEvent.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onRemoveArticles(
    RemoveArticle removeEvent,
    Emitter<LocalArticleState> emit,
  ) async {
    emit(const LocalArticleLoading());
    await _removeArticleUseCase(params: removeEvent.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }
}
