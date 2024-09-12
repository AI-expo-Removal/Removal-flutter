import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:removal_flutter/core/component/widget/removal_dialog.dart';
import 'package:removal_flutter/core/constants/removal_style.dart';
import 'package:removal_flutter/presentation/video/provider/get_basic_subtitle_video_view_model_provider.dart';

class CompressedVideoAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CompressedVideoAppBar({super.key});

  @override
  ConsumerState<CompressedVideoAppBar> createState() =>
      _CompressedVideoAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _CompressedVideoAppBarState extends ConsumerState<CompressedVideoAppBar> {
  @override
  void initState() {
    super.initState();
    FlutterDownloader.registerCallback(downloadCallback);
  }

  static void downloadCallback(String id, int status, int progress) {
    print(
        'Background Isolate Callback: task ($id) is in status ($status) and progress ($progress)');
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    final basicSubtitledState =
        ref.watch(getBasicSubtitleVideoViewModelProvider);
    return SafeArea(
      child: PreferredSize(
        preferredSize: widget.preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: RemovalColor.gray100,
          scrolledUnderElevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop('/video');
                },
                child: SvgPicture.asset(
                  "assets/images/icon/video/close_icon.svg",
                ),
              ),
              GestureDetector(
                onTap: () async {
                  String dir = (await getApplicationDocumentsDirectory()).path;
                  try {
                    await FlutterDownloader.enqueue(
                      url: "${basicSubtitledState.detail!.s3Url}",
                      savedDir: '$dir/', // 저장할 dir
                      fileName: '${basicSubtitledState.detail!.s3Url}', // 파일명
                      saveInPublicStorage: true, // 동일한 파일 있을 경우 덮어쓰기
                    );

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return RemovalDialog(
                          content: "동영상 다운로드가 완료되었습니다.\n처음 화면으로 돌아가시겠습니까?",
                          cancelFunc: () => context.pop("/compressed"),
                          acceptFunc: () {
                            context.go("/");
                          },
                        );
                      },
                    );
                  } catch (e) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return RemovalDialog(
                          content: "동영상 다운로드에 실패하였습니다.\n처음 화면으로 돌아가시겠습니까?",
                          cancelFunc: () => context.pop("/compressed"),
                          acceptFunc: () {
                            context.go("/");
                          },
                        );
                      },
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RemovalColor.main,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Center(
                      child: Text(
                        "영상 다운로드",
                        style: RemovalTextStyle.button3(
                          color: RemovalColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
