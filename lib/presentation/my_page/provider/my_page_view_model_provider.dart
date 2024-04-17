import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/use_cases/providers/auth_use_case_provider.dart';
import 'package:removal_flutter/presentation/my_page/provider/state/my_page_state.dart';
import 'package:removal_flutter/presentation/my_page/provider/state/my_page_view_model.dart';
import 'package:removal_flutter/presentation/my_page/view/my_page_screen.dart';

final myPageViewModelProvider = StateNotifierProvider<MyPageViewModel, MyPageState>((ref) {
  final authUseCase = ref.watch(authUseCaseProvider);
  return MyPageViewModel(authUseCase: authUseCase);
});