import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/use_cases/providers/auth_use_case_provider.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sign_up_state.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sign_up_view_model.dart';

final signUpViewModelProvider = StateNotifierProvider<SignUpViewModel, SignUpState>((ref) {
  final authUseCase = ref.watch(authUseCaseProvider);
  return SignUpViewModel(authUseCase: authUseCase);
});