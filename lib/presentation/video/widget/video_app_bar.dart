import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/video/provider/compress_video_view_model_provider.dart';
import 'package:removal_flutter/presentation/video/provider/get_video_view_model_provider.dart';
import 'package:removal_flutter/presentation/video/provider/upload_video_view_model_provider.dart';

class VideoAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const VideoAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadVideoState = ref.watch(uploadVideoViewModelProvider);
    final compressedVideoState = ref.watch(compressVideoViewModelProvider);
    final getVideoState = ref.watch(getVideoViewModelProvider);
    final getVideoNotifier = ref.read(getVideoViewModelProvider.notifier);
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: RemovalColor.gray100,
          scrolledUnderElevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop('/main');
                },
                child: SvgPicture.asset(
                  "assets/images/icon/video/close_icon.svg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint(getVideoState.videoPath);
                  if (compressedVideoState.statusCode == 200) {
                    getVideoNotifier.getVideo(
                        videoName: uploadVideoState.title!);
                    if (getVideoState.statusCode == 200) {
                      print(getVideoState.videoPath);
                      context.push("/compressed",
                          extra: getVideoState.videoPath);
                    }
                  }
                  //
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
                        "내보내기",
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

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
