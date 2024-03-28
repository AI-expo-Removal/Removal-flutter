import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/use_cases/providers/sms_use_case_provider.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sms_state.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sms_view_model.dart';

final smsViewModelProvider = StateNotifierProvider<SMSViewModel, SMSState>((ref) {
  final smsUseCase = ref.watch(smsUseCaseProvider);
  return SMSViewModel(smsUseCase: smsUseCase);
});