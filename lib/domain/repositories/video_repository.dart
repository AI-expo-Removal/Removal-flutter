import 'dart:io';

abstract class VideoRepository {
  Future<void> uploadS3(File video);

  Future<void> uploadRemoval({
    required File video,
  });

  Future<void> uploadTranslate({
    required File video,
  });

  Future<void> uploadVideo({
    required File video,
  });
}
