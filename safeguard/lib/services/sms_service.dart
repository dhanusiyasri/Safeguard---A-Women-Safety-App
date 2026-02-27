import 'package:telephony/telephony.dart';

class SmsService {
  static final Telephony telephony = Telephony.instance;

  static Future<void> sendSMS(String number, String message) async {
    bool? permissionsGranted = await telephony.requestSmsPermissions;

    if (permissionsGranted == true) {
      await telephony.sendSms(
        to: number,
        message: message,
      );
    } else {
      throw Exception("SMS permission not granted");
    }
  }
}
