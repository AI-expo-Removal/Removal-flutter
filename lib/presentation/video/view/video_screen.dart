import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/video/provider/video_view_model_provider.dart';
import 'package:removal_flutter/presentation/video/widget/video_app_bar.dart';
import 'package:removal_flutter/presentation/video/widget/video_function_widget.dart';
import 'package:video_editor/video_editor.dart';

class VideoScreen extends ConsumerStatefulWidget {
  /// Go router의 extra의 타입은 Object이어야함.
  /// extra => 값을 넘겨줄 때 사용하는 파라미터
  final Object? file;

  const VideoScreen({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  ConsumerState<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<VideoScreen> {
  late final VideoEditorController controller = VideoEditorController.file(
    widget.file as File,
    minDuration: const Duration(seconds: 0),
    maxDuration: const Duration(seconds: 60),
  );

  @override
  void initState() {
    super.initState();
    controller.initialize().then((_) {
      setState(() {});
    }).catchError((error) {
      if (error is VideoMinDurationError) {
        // handle minimum duration bigger than video duration error
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, "0"),
        duration.inSeconds.remainder(60).toString().padLeft(2, "0"),
      ].join(":");

  @override
  Widget build(BuildContext context) {
    final videoState = ref.watch(videoViewModelProvider);
    final videoNotifier = ref.read(videoViewModelProvider.notifier);
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const VideoAppBar(),
      body: controller.video.value.isInitialized
          ? SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 2),
                  SizedBox(
                    height: 390,
                    width: 390,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Center(
                          child: CropGridViewer.preview(
                            controller: controller,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.isPlaying
                                  ? controller.video.pause()
                                  : controller.video.play();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SvgPicture.asset(
                              controller.isPlaying
                                  ? "assets/images/icon/video/play_icon.svg"
                                  : "assets/images/icon/video/pause_icon.svg",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedBuilder(
                                animation: controller.video,
                                builder: (context, child) {
                                  final duration =
                                      controller.video.value.duration.inSeconds;
                                  final pos =
                                      controller.trimPosition * duration;
                                  final end = controller.maxTrim * duration;
                                  return RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: formatter(
                                            Duration(seconds: pos.toInt()),
                                          ),
                                          style: RemovalTextStyle.caption2(
                                              color: RemovalColor.white),
                                        ),
                                        TextSpan(
                                          text:
                                              "/${formatter(Duration(seconds: end.toInt()))}",
                                          style: RemovalTextStyle.caption2(
                                              color: RemovalColor.gray50),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.push(
                                    '/videoAmplify',
                                    extra: controller,
                                  );
                                },
                                child: SvgPicture.asset(
                                  "assets/images/icon/video/amplify_icon.svg",
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TrimSlider(controller: controller),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            videoNotifier.uploadRemoval(video: controller.file);
                          },
                          child: VideoFunctionWidget(
                            iconPath:
                                "assets/images/icon/video/translate_icon.svg",
                            title: "자동 번역",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            videoNotifier.uploadTranslate(video: controller.file);
                            print(controller.file);
                          },
                          child: VideoFunctionWidget(
                            iconPath: "assets/images/icon/video/caption_icon.svg",
                            title: "자동 번역",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            videoNotifier.uploadVideo(video: controller.file);
                          },
                          child: VideoFunctionWidget(
                            iconPath: "assets/images/icon/video/eraser_icon.svg",
                            title: "자동 번역",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                ],
              ),
            )
          : Container(),
    );
  }
}
