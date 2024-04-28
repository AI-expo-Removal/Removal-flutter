import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/use_cases/providers/video_use_case_provider.dart';
import 'package:removal_flutter/presentation/video/provider/state/video_state.dart';
import 'package:removal_flutter/presentation/video/provider/state/video_view_model.dart';

final videoViewModelProvider = StateNotifierProvider<VideoViewModel, VideoState>((ref) {
  final videoUseCase = ref.watch(videoUseCaseProvider);
  return VideoViewModel(videoUseCase: videoUseCase);
});