import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/core/di/provider/re_issue/state/re_issue_state.dart';
import 'package:removal_flutter/domain/models/auth/token/token_model.dart';
import 'package:removal_flutter/domain/use_cases/auth_use_case.dart';

class ReIssueViewModel extends StateNotifier<ReIssueState> {
  final AuthUseCase _authUseCase;

  ReIssueViewModel({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(ReIssueState.initial);

  Future<TokenModel> reIssue({
    required String accessToken,
  }) async {
    state = ReIssueState.loading;
    try {
      final response = await _authUseCase.reIssue(
        accessToken: accessToken,
      );
      state = ReIssueState.success;
      return TokenModel(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
    } catch (err) {
      state = ReIssueState.failure;
      throw Exception(err.toString());
    }
  }
}
