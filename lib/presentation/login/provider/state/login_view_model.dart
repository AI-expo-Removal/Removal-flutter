import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/models/auth/token/token_model.dart';
import 'package:removal_flutter/domain/use_cases/auth_use_case.dart';
import 'package:removal_flutter/presentation/login/provider/state/login_state.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  final AuthUseCase _authUseCase;

  LoginViewModel({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(LoginState.initial);

  Future<TokenModel> postLogin({
    required String accountId,
    required String password,
  }) async {
    state = LoginState.loading;
    try {
      final response = await _authUseCase.postLogin(
        accountId: accountId,
        password: password,
      );

      state = LoginState.success;
      saveToken(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
      return response;
    } catch (e) {
      state = LoginState.failure;
      rethrow;
    }
  }

  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _authUseCase.saveToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
