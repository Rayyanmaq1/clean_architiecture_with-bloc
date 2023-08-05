import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/widgets/article_widget.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: ((context, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is RemoteArticlesError) {
          log(state.error.toString());
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemCount: state.article!.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.article![index],
                onArticlePressed: (article) =>
                    _onArticlePressed(context, article),
              );
            },
          );
        }
        return const SizedBox();
      }),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
