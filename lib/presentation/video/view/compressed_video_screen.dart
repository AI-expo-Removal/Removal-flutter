import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:removal_flutter/core/constants/removal_style.dart';
import 'package:removal_flutter/presentation/video/widget/compressed_video_app_bar.dart';
import 'package:video_player/video_player.dart';

class CompressedVideoScreen extends StatefulWidget {
  final String path;

  const CompressedVideoScreen({
    super.key,
    required this.path,
  });

  @override
  State<CompressedVideoScreen> createState() => _CompressedVideoScreenState();
}

class _CompressedVideoScreenState extends State<CompressedVideoScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.path))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const CompressedVideoAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset(
                    controller.value.isPlaying
                        ? "assets/images/icon/video/play_icon.svg"
                        : "assets/images/icon/video/pause_icon.svg",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
