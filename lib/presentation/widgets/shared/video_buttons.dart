import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tic_toc/config/helpers/formater_number.dart';
import 'package:tic_toc/domain/entities/videos_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _CustomIconButton(
          value: video.likes, icon: Icons.favorite, iconColor: Colors.red),
      const SizedBox(
        height: 15,
      ),
      _CustomIconButton(
          value: video.views, icon: Icons.remove_red_eye_outlined),
      const SizedBox(
        height: 15,
      ),
      SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 3),
          child: const _CustomIconButton(
              value: 0, icon: Icons.play_circle_outline))
    ]);
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color? iconColor;

  const _CustomIconButton(
      {required this.value, required this.icon, this.iconColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: iconColor,
          size: 35,
        ),
      ),
      if (value > 0) Text(FormaterNumber.humanReadableNumber(value)),
    ]);
  }
}
