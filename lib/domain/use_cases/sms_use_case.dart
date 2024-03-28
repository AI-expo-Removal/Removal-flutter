import 'package:removal_flutter/domain/repositories/sms_repository.dart';

class SMSUseCase {
  final SMSRepository _repository;

  SMSUseCase({
    required SMSRepository repository,
  }) : _repository = repository;

  Future<void> postSMS({
    required String phoneNumber,
  }) async {
    await _repository.postSMS(
      phoneNumber: phoneNumber,
    );
  }

  Future<void> getSMS({
    required String phoneNumber,
    required String randomNumber,
  }) async {
    await _repository.getSMS(
      phoneNumber: phoneNumber,
      randomNumber: randomNumber,
    );
  }
}
