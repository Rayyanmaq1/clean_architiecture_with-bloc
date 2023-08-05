import 'package:dio/dio.dart';
import 'package:flutter_bloc_api/core/constants/constants.dart';
import 'package:flutter_bloc_api/features/daily_news/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newAPIbaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
