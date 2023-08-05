// ignore_for_file: must_be_immutable

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/core/constants/constants.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
@immutable
class ArticleModel extends ArticleEntity {
  ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          id: id,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  ArticleModel.fromJson(Map<String, dynamic> map) {
    author = map['author'] ?? "";
    title = map['title'] ?? "";
    description = map['description'] ?? "";
    url = map['url'] ?? "";
    urlToImage = map['urlToImage'] != null && map['urlToImage'] != ""
        ? map['urlToImage']
        : kDefaultImage;
    publishedAt = map['publishedAt'] ?? "";
    content = map['content'] ?? "";
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
        id: entity.id,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content);
  }

  @override
  List<Object?> get props => [
        id,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
