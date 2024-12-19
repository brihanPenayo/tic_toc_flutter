import 'package:flutter/material.dart';
import 'package:tic_toc/domain/entities/videos_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _CustomIconButton(
          value: video.likes, icon: Icons.favorite, color: Colors.white)
    ]);
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color? color;

  const _CustomIconButton({required this.value, required this.icon, color})
      : color = color ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(onPressed: null, icon: Icon(icon), color: color),
      Text(value.toString()),
    ]);
  }
}
