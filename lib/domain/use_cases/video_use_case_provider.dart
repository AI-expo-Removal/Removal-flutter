import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/repositories/video_repository_provider.dart';
import 'package:removal_flutter/domain/use_cases/video_use_case.dart';

final videoUseCaseProvider = Provider<VideoUseCase>(
  (ref) {
    final repository = ref.watch(videoRepositoryProvider);
    return VideoUseCase(repository: repository);
  },
);
