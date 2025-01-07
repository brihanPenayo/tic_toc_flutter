import 'package:tic_toc/domain/entities/videos_post.dart';

abstract class VideoPostsDatasource {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFavoritesVideosByUser(String userId);
}
