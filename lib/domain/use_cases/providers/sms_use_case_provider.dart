import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/repositories/providers/sms_repository_provider.dart';
import 'package:removal_flutter/domain/use_cases/sms_use_case.dart';

final smsUseCaseProvider = Provider<SMSUseCase>((ref) {
  final repository = ref.watch(smsRepositoryProvider);
  return SMSUseCase(repository: repository);
});