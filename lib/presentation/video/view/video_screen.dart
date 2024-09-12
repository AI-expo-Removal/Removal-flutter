import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/component/widget/removal_dialog.dart';
import 'package:removal_flutter/core/constants/removal_style.dart';
import 'package:removal_flutter/presentation/video/provider/get_basic_subtitle_video_view_model_provider.dart';
import 'package:removal_flutter/presentation/video/provider/upload_video_view_model_provider.dart';
import 'package:removal_flutter/presentation/video/widget/video_app_bar.dart';
import 'package:removal_flutter/presentation/video/widget/video_function_widget.dart';
import 'package:video_editor/video_editor.dart';

class VideoScreen extends ConsumerStatefulWidget {
  final File file;

  const VideoScreen({
    super.key,
    required this.file,
  });

  @override
  ConsumerState<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<VideoScreen> {
  late final VideoEditorController controller = VideoEditorController.file(
    widget.file,
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
    final uploadVideoState = ref.watch(uploadVideoViewModelProvider);
    final basicSubtitleNotifier =
        ref.read(getBasicSubtitleVideoViewModelProvider.notifier);
    final basicSubtitleState =
        ref.watch(getBasicSubtitleVideoViewModelProvider);
    ref.listen(
      getBasicSubtitleVideoViewModelProvider
          .select((value) => value.statusCode),
      (previous, next) {
        if (next == const AsyncData<int?>(200)) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return RemovalDialog(
                content: "자막 처리가 완료되었습니다.",
                cancelFunc: () => context.pop("/video"),
                acceptFunc: () {
                  context.push(
                    "/compressed",
                    extra: ref.watch(getBasicSubtitleVideoViewModelProvider).detail!.s3Url,
                  );
                },
              );
            },
          );
        } if (next == const AsyncData<int?>(500))  {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return RemovalDialog(
                content: "자막 처리에 실패했습니다.",
                cancelFunc: () => context.pop("/video"),
                acceptFunc: () {
                  context.pop("/video");
                },
              );
            },
          );
        }
      },
    );
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
                    padding: const EdgeInsets.symmetric(horizontal: 38.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const VideoFunctionWidget(
                          iconPath:
                              "assets/images/icon/video/translate_icon.svg",
                          title: "개발 중...",
                        ),
                        GestureDetector(
                          onTap: () {
                            basicSubtitleNotifier.getBasicSubtitleVideo(
                                videoPath: uploadVideoState.filePath!);
                          },
                          child: basicSubtitleState.statusCode ==
                                  const AsyncValue<int?>.loading()
                              ? CupertinoActivityIndicator(
                                  color: RemovalColor.white,
                                )
                              : const VideoFunctionWidget(
                                  iconPath:
                                      "assets/images/icon/video/caption_icon.svg",
                                  title: "자막 추가",
                                ),
                        ),
                        const VideoFunctionWidget(
                          iconPath: "assets/images/icon/video/eraser_icon.svg",
                          title: "개발 중...",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            )
          : Container(),
    );
  }
}
