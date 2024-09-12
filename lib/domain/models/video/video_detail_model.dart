class VideoDetailModel {
  final String? s3Url;

  VideoDetailModel({
    required this.s3Url,
  });

  factory VideoDetailModel.fromJson(Map<String, dynamic> json) {
    return VideoDetailModel(
      s3Url: json['s3_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      's3_url': s3Url,
    };
  }
}
