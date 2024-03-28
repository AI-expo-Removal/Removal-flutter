abstract class SMSRepository {
  Future<void> postSMS({
    required String phoneNumber,
  });

  Future<void> getSMS({
    required String phoneNumber,
    required String randomNumber,
  });
}
