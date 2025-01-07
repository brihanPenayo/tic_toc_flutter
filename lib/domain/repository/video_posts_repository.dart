import 'package:tic_toc/domain/entities/videos_post.dart';

abstract class VideoPostsRepository {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFavoritesVideosByUser(String userId);
}
