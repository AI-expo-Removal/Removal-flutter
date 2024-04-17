import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/models/auth/user/user_model.dart';
import 'package:removal_flutter/domain/use_cases/auth_use_case.dart';
import 'package:removal_flutter/presentation/my_page/provider/state/my_page_state.dart';

class MyPageViewModel extends StateNotifier<MyPageState> {
  final AuthUseCase _authUseCase;

  MyPageViewModel({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(MyPageState.initial);

  Future<UserModel> getUser({
    required String accessToken,
  }) async {
    state = MyPageState.loading;
    try {
      final response = await _authUseCase.getUser(
        accessToken: accessToken,
      );
      state = MyPageState.success;
      return UserModel(
        accountId: response.accountId,
        name: response.name,
      );
    } catch (err) {
      state = MyPageState.failure;
      throw Exception(err.toString());
    }
  }
}
