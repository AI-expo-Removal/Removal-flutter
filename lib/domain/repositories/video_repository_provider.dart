import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/data/data_sources/video/remote/remote_video_data_source_provider.dart';
import 'package:removal_flutter/data/repositories/video_respository_impl.dart';

final videoRepositoryProvider = Provider<VideoRepositoryImpl>((ref) {
  final remoteVideoDataSource = ref.watch(remoteVideoDataSourceProvider);
  return VideoRepositoryImpl(remoteVideoDataSource: remoteVideoDataSource);
});
