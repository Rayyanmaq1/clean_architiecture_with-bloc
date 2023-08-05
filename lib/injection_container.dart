import 'package:flutter_bloc_api/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_bloc_api/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_bloc_api/features/daily_news/data/repository/article_repository_impt.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/usecases/get_articles.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

GetIt sl = GetIt.instance;

Future<void> intializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  // DIO
  sl.registerSingleton<Dio>(Dio());
  // dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));
  // Usecase
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  // Bloc
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
