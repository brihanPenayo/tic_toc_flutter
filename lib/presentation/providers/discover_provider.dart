import 'package:flutter/material.dart';
import 'package:tic_toc/domain/entities/videos_post.dart';
import 'package:tic_toc/infrastructure/models/local_video_model.dart';
import 'package:tic_toc/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: repositorio, datasource
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((vid) => LocalVideoModel.fromJson(vid).toVideoPostEntity())
        .toList();
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
