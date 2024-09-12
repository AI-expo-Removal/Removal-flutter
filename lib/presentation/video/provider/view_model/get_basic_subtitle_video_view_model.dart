import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/models/video/video_detail_model.dart';
import 'package:removal_flutter/domain/models/video/video_response_model.dart';
import 'package:removal_flutter/domain/use_cases/video_use_case.dart';

class GetBasicSubtitleVideoViewModel extends StateNotifier<VideoResponseModel> {
  final VideoUseCase _videoUseCase;

  GetBasicSubtitleVideoViewModel({
    required VideoUseCase videoUseCase,
  })  : _videoUseCase = videoUseCase,
        super(
          VideoResponseModel(
            statusCode: const AsyncData(500),
            detail: VideoDetailModel(s3Url: null),
            header: null,
          ),
        );

  Future<void> getBasicSubtitleVideo({
    required String videoPath,
  }) async {
    try {
      state = state.copyWith(statusCode: const AsyncValue.loading());

      final res =
          await _videoUseCase.getBasicSubtitleVideo(videoPath: videoPath);
      state = state.copyWith(
        statusCode: res.statusCode,
        detail: VideoDetailModel(s3Url: res.detail!.s3Url),
        header: res.header,
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
