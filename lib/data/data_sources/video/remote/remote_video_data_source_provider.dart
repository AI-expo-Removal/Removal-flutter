import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/data/data_sources/video/remote/remote_video_data_source.dart';

final remoteVideoDataSourceProvider =
    Provider<RemoteVideoDataSource>((ref) => RemoteVideoDataSource());
