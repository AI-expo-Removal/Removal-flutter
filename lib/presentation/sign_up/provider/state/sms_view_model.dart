import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/use_cases/sms_use_case.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sms_state.dart';

class SMSViewModel extends StateNotifier<SMSState> {
  final SMSUseCase _smsUseCase;

  SMSViewModel({required SMSUseCase smsUseCase})
      : _smsUseCase = smsUseCase,
        super(SMSState.initial);

  Future<void> postSMS({
    required String phoneNumber,
  }) async {
    state = SMSState.sending;
    try {
      await _smsUseCase.postSMS(
        phoneNumber: phoneNumber,
      );
      state = SMSState.sendingSuccess;
    } catch (err) {
      state = SMSState.sendingFailure;
      throw Exception(err.toString());
    }
  }

  Future<void> getSMS({
    required String phoneNumber,
    required String randomNumber,
  }) async {
    state = SMSState.matching;
    try {
      await _smsUseCase.getSMS(
        phoneNumber: phoneNumber,
        randomNumber: randomNumber,
      );
      state = SMSState.matchingSuccess;
    } catch (err) {
      state = SMSState.matchingFailure;
      throw Exception(err.toString());
    }
  }
}
