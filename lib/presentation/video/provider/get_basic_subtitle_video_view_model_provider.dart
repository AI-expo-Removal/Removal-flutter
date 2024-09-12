import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/models/video/video_response_model.dart';
import 'package:removal_flutter/domain/use_cases/video_use_case_provider.dart';
import 'package:removal_flutter/presentation/video/provider/view_model/get_basic_subtitle_video_view_model.dart';

final getBasicSubtitleVideoViewModelProvider = StateNotifierProvider.autoDispose<GetBasicSubtitleVideoViewModel, VideoResponseModel>((ref) {
  return GetBasicSubtitleVideoViewModel(videoUseCase: ref.watch(videoUseCaseProvider));
});
