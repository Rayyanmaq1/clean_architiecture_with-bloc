import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/pages/article_detail/article_details.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/pages/save_article/save_article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/ArticleDetails':
        return _materialRoute(
            ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
