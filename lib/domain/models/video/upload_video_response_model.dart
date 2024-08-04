class UploadVideoResponseModel {
  final String? title;
  final String? message;
  final String? filePath;

  UploadVideoResponseModel({
    required this.message,
    required this.title,
    required this.filePath,
  });

  factory UploadVideoResponseModel.fromJson(Map<String, dynamic> json) {
    return UploadVideoResponseModel(
      title: json['title'],
      message: json['message'],
      filePath: json['filePath'],
    );
  }
}
