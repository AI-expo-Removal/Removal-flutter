import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/repositories/providers/auth_repository_provider.dart';
import 'package:removal_flutter/domain/use_cases/auth_use_case.dart';

final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
;  return AuthUseCase(repository: authRepository);
});
