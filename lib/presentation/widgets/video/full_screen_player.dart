import 'package:flutter/material.dart';
import 'package:tic_toc/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      controller = VideoPlayerController.asset(widget.videoUrl);
      await controller.initialize();
      controller.setVolume(0);
      controller.setLooping(true);
      await controller.play();
    } catch (e) {
      setState(() {
        errorMessage = 'Error loading video: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Center(
          child:
              Text(errorMessage!, style: const TextStyle(color: Colors.white)));
    }

    if (isLoading || !controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    return _VideoPlayer(widget: widget, controller: controller);
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: textStyle,
      ),
    );
  }
}

class _VideoPlayer extends StatelessWidget {
  final FullScreenPlayer widget;
  final VideoPlayerController controller;
  const _VideoPlayer({required this.widget, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          if (controller.value.isPlaying) {
            await controller.pause();
          } else {
            await controller.play();
          }
        } catch (e) {
          debugPrint('Error toggling play/pause: $e');
        }
      },
      child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(children: [
            VideoPlayer(controller),
            VideoBackground(),
            Positioned(
              bottom: 40,
              left: 50,
              child: _VideoCaption(caption: widget.caption),
            ),
            ValueListenableBuilder<VideoPlayerValue>(
              valueListenable: controller,
              builder: (context, value, child) {
                if (!value.isPlaying) {
                  return const Center(
                    child: Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                      size: 60,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ])),
    );
  }
}
