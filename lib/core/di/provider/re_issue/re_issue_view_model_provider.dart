import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/core/di/provider/re_issue/state/re_issue_state.dart';
import 'package:removal_flutter/core/di/provider/re_issue/state/re_issue_view_model.dart';
import 'package:removal_flutter/domain/use_cases/providers/auth_use_case_provider.dart';

final reIssueViewModelProvider = StateNotifierProvider<ReIssueViewModel, ReIssueState>((ref) {
  final authUseCase = ref.watch(authUseCaseProvider);
  return ReIssueViewModel(authUseCase: authUseCase);
});