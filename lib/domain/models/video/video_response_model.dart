import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/models/video/video_detail_model.dart';

class VideoResponseModel {
  final AsyncValue<int?> statusCode;
  final VideoDetailModel? detail;
  final String? header;

  VideoResponseModel({
    required this.statusCode,
    required this.detail,
    required this.header,
  });

  factory VideoResponseModel.fromJson(
      Map<String, dynamic> json
  ) {
    return VideoResponseModel(
      statusCode: AsyncData<int?>(json["status_code"]),
      detail: VideoDetailModel.fromJson(json["detail"]),
      header: json["header"],
    );
  }

  VideoResponseModel copyWith({
    AsyncValue<int?>? statusCode,
    VideoDetailModel? detail,
    String? header,
  }) {
    return VideoResponseModel(
      statusCode: statusCode ?? this.statusCode,
      detail: detail ?? this.detail,
      header: header ?? this.header,
    );
  }
}
