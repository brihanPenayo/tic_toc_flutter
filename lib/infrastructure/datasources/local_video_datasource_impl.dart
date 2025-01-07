import 'package:tic_toc/domain/datasource/video_posts_datasource.dart';
import 'package:tic_toc/domain/entities/videos_post.dart';
import 'package:tic_toc/infrastructure/models/local_video_model.dart';
import 'package:tic_toc/shared/data/local_video_post.dart';

class LocalVideoDatasource implements VideoPostsDatasource {
  @override
  Future<List<VideoPost>> getFavoritesVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((vid) => LocalVideoModel.fromJson(vid).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
