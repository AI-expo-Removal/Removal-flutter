class VideoResponseModel {
  final String? videoPath;
  final int? statusCode;

  VideoResponseModel({
    required this.videoPath,
    required this.statusCode,
  });

  factory VideoResponseModel.fromJson(
      Map<String, dynamic> json, int? statusCode) {
    return VideoResponseModel(
      videoPath: json['videoPath'],
      statusCode: statusCode,
    );
  }

  VideoResponseModel copyWith({String? videoPath, int? statusCode}) {
    return VideoResponseModel(
      videoPath: videoPath ?? this.videoPath,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
