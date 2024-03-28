import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/use_cases/providers/auth_use_case_provider.dart';
import 'package:removal_flutter/presentation/login/provider/state/login_state.dart';
import 'package:removal_flutter/presentation/login/provider/state/login_view_model.dart';

final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(
    authUseCase: ref.watch(authUseCaseProvider),
  ),
);
