import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/widgets/article_widget.dart';
import 'package:flutter_bloc_api/injection_container.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

class SavedArticles extends HookWidget {
  const SavedArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()..add(const GetLocalArticle()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      title:
          const Text('Saved Articles', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalArticleBloc, LocalArticleState>(
      builder: (context, state) {
        if (state is LocalArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalArticleDone) {
          return _buildArticlesList(state.article!);
        }
        return Container();
      },
    );
  }

  Widget _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED ARTICLES',
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleWidget(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => _onRemoveArticle(context, article),
          onArticlePressed: (article) => _onArticlePressed(context, article),
        );
      },
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalArticleBloc>(context).add(RemoveArticle(article));
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}
