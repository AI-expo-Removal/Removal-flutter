import 'package:removal_flutter/data/data_sources/sms/remote/remote_sms_data_source.dart';
import 'package:removal_flutter/domain/repositories/sms_repository.dart';

class SMSRepositoryImpl implements SMSRepository {
  final RemoteSMSDataSource _remoteSMSDataSource;

  SMSRepositoryImpl({required RemoteSMSDataSource remoteSMSDataSource})
      : _remoteSMSDataSource = remoteSMSDataSource;

  @override
  Future<void> postSMS({
    required String phoneNumber,
  }) async {
    await _remoteSMSDataSource.postSMS(
      phoneNumber: phoneNumber,
    );
  }

  @override
  Future<void> getSMS({
    required String phoneNumber,
    required String randomNumber,
  }) async {
    await _remoteSMSDataSource.getSMS(
      phoneNumber: phoneNumber,
      randomNumber: randomNumber,
    );
  }
}
