import 'package:tic_toc/domain/datasource/video_posts_datasource.dart';
import 'package:tic_toc/domain/entities/videos_post.dart';
import 'package:tic_toc/domain/repository/video_posts_repository.dart';

class VideoPostRepository implements VideoPostsRepository {
  final VideoPostsDatasource videosDatasource;

  VideoPostRepository({required this.videosDatasource});
  @override
  Future<List<VideoPost>> getFavoritesVideosByUser(String userId) {
    return videosDatasource.getFavoritesVideosByUser(userId);
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
