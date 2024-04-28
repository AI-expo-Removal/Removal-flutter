import 'dart:io';

abstract class VideoRepository {
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
