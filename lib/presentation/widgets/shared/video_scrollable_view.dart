import 'package:flutter/material.dart';
import 'package:tic_toc/domain/entities/videos_post.dart';
import 'package:tic_toc/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            Positioned(
                bottom: 40,
                right: 20,
                child: VideoButtons(
                  video: videoPost,
                )),
          ],
        );
      },
    );
  }
}
