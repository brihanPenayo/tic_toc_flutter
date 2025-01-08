import 'package:flutter/material.dart';
import 'package:tic_toc/domain/entities/videos_post.dart';
import 'package:tic_toc/infrastructure/repository/video_post_repository_impl.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepositoryImpl videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
