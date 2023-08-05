import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api/core/resources/data_state.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/usecases/get_articles.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _articleUseCase;

  RemoteArticleBloc(this._articleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticle>(onGetArticle);
  }
  void onGetArticle(GetArticle event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _articleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticlesDone(dataState.data!),
      );
    } else if (dataState is DataFailed) {
      emit(
        RemoteArticlesError(dataState.error!),
      );
    }
  }
}
