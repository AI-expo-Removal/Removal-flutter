import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/main/widget/main_app_bar.dart';
import 'package:removal_flutter/presentation/main/widget/main_function_script_widget.dart';
import 'package:removal_flutter/presentation/main/widget/main_create_project_widget.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo/main_title1.png",
                  height: 76,
                ),
                const SizedBox(height: 32),
                Image.asset(
                  "assets/images/logo/main_image1.png",
                  height: 270,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: GestureDetector(
                    onTap: () async {
                      final XFile? video =
                          await _picker.pickVideo(source: ImageSource.gallery);
                      if (video != null) {
                        context.push("/video", extra: File(video.path));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("동영상을 불러오지 못했습니다."),
                          ),
                        );
                      }
                    },
                    child: const MainCreateProjectWidget(),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "클릭",
                        style: RemovalTextStyle.heading2(
                          color: RemovalColor.white,
                        ),
                      ),
                      TextSpan(
                        text: " 한 번으로",
                        style: RemovalTextStyle.heading2(
                          color: RemovalColor.main50,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "완벽하게 하는 AI 편집",
                  style: RemovalTextStyle.heading2(
                    color: RemovalColor.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "영상을 자막을 수동으로 달지 않고,\n번역을 직접하지 않아도 되고\n비속어를 자르기 힘들었다면?",
                  style: RemovalTextStyle.body1(
                    color: RemovalColor.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Image.asset(
                  "assets/images/logo/main_image2.png",
                  height: 200,
                ),
                const SizedBox(height: 100),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "새로운",
                        style: RemovalTextStyle.heading2(
                          color: RemovalColor.main50,
                        ),
                      ),
                      TextSpan(
                        text: " 영상편집",
                        style: RemovalTextStyle.heading2(
                          color: RemovalColor.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const MainFunctionScriptWidget(
                  iconPath:
                      "assets/images/icon/main/colored_translate_icon.svg",
                  title: "자동 번역",
                  localDescription: "AI가 영상의 음성을 인식해\n영어를 한국어로 바꿔\n자막을 달아줍니다.",
                  translateDescription:
                      "AI recognizes the voice of the video\nChange English to Korean\nI'll add subtitles.",
                ),
                const SizedBox(height: 36),
                const MainFunctionScriptWidget(
                  iconPath: "assets/images/icon/main/colored_caption_icon.svg",
                  title: "자동 자막",
                  localDescription: "AI가 영상의 음성을 인식해\n자동으로 시간에 맞춰\n자막을 달아줍니다.",
                  translateDescription:
                      "AI recognizes the voice of the video\nautomatically on time\nand adds subtitles.",
                ),
                const SizedBox(height: 36),
                const MainFunctionScriptWidget(
                  iconPath: "assets/images/icon/main/colored_eraser_icon.svg",
                  title: "비속어 삭제",
                  localDescription:
                      "AI가 영상의 음성을 인식해\n비속어가 있다면\n비속어를 별(*)표시를 해줍니다.",
                  translateDescription:
                      "AI recognizes the audio in the video and,\nif there is bad language,\nmarks it with a star(*).",
                ),
                const SizedBox(height: 100),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "사용하기 편한",
                        style: RemovalTextStyle.heading2(
                          color: RemovalColor.main50,
                        ),
                      ),
                      TextSpan(
                        text: " 편집 툴",
                        style: RemovalTextStyle.heading2(
                          color: RemovalColor.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "직관적인 UI로\n누구나 쉽게 사용할 수 있습니다.",
                  textAlign: TextAlign.center,
                  style: RemovalTextStyle.subTitle2(
                    color: RemovalColor.white,
                  ),
                ),
                const SizedBox(height: 32),
                Image.asset("assets/images/logo/main_image3.png",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
