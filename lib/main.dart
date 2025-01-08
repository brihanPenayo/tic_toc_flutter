import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_toc/config/theme/app_theme.dart';
import 'package:tic_toc/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tic_toc/infrastructure/repository/video_post_repository_impl.dart';
import 'package:tic_toc/presentation/providers/discover_provider.dart';
import 'package:tic_toc/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostRepositoryImpl(videosDatasource: LocalVideoDatasource());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videosRepository: videoPostRepository)
                  ..loadNextPage())
      ],
      child: MaterialApp(
          title: 'TicToc',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
