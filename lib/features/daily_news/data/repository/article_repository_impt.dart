import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_api/core/constants/constants.dart';
import 'package:flutter_bloc_api/core/resources/data_state.dart';
import 'package:flutter_bloc_api/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_bloc_api/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_bloc_api/features/daily_news/data/models/article_model.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponce = await _newsApiService.getNewsArticles(
        apiKey: newsApiKey,
        category: categoruQuery,
        country: countryQuery,
      );
      if (httpResponce.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponce.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponce.response.requestOptions,
            response: httpResponce.response,
            error: httpResponce.response.statusCode,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity articleEntity) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(articleEntity));
  }

  @override
  Future<void> saveArticles(ArticleEntity articleEntity) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(articleEntity));
  }
}
