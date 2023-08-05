import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/config/routes/app_routes.dart';
import 'package:flutter_bloc_api/config/themes/app_theme.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_bloc_api/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_bloc_api/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticle()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const DailyNews()),
    );
  }
}
