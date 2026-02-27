import 'package:flutter_background_service/flutter_background_service.dart';

class BackgroundService {
  static Future<void> initialize() async {
    final service = FlutterBackgroundService();
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(),
    );
    service.startService();
  }

  static void onStart(ServiceInstance service) {}
}
