import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/models/video/compressed_video_response_model.dart';
import 'package:removal_flutter/domain/use_cases/providers/video_use_case_provider.dart';
import 'package:removal_flutter/presentation/video/provider/state/compress_video_view_model.dart';

final compressVideoViewModelProvider = StateNotifierProvider<CompressVideoViewModel, CompressedVideoResponseModel>((ref) => CompressVideoViewModel(videoUseCase: ref.watch(videoUseCaseProvider)));
