import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/models/video/video_response_model.dart';
import 'package:removal_flutter/domain/use_cases/providers/video_use_case_provider.dart';
import 'package:removal_flutter/presentation/video/provider/state/get_video_view_model.dart';

final getVideoViewModelProvider = StateNotifierProvider<GetVideoViewModel, VideoResponseModel>((ref) {
  return GetVideoViewModel(videoUseCase: ref.watch(videoUseCaseProvider));
});
