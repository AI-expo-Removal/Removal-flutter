import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/use_cases/auth_use_case.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sign_up_state.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  final AuthUseCase _authUseCase;

  SignUpViewModel({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(SignUpState.initial);

  Future<void> postSignUp({
    required String accountId,
    required String password,
    required String name,
  }) async {
    state = SignUpState.loading;
    try {
      await _authUseCase.postSignUp(
        accountId: accountId,
        password: password,
        name: name,
      );
      state = SignUpState.success;
    } catch (err) {
      state = SignUpState.failure;
      throw Exception(err.toString());
    }
  }
}
