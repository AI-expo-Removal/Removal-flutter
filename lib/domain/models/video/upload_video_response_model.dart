import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadVideoResponseModel {
  final AsyncValue<int?> statusCode;
  final String? title;
  final String? message;
  final String? filePath;

  UploadVideoResponseModel({
    required this.statusCode,
    required this.message,
    required this.title,
    required this.filePath,
  });

  factory UploadVideoResponseModel.fromJson(
      Map<String, dynamic> json, AsyncValue<int?> statusCode) {
    return UploadVideoResponseModel(
      statusCode: statusCode,
      title: json['title'],
      message: json['message'],
      filePath: json['file_path'],
    );
  }
}
