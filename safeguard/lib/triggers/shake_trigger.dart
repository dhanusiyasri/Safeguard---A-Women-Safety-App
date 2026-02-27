import 'dart:math';
import 'package:sensors_plus/sensors_plus.dart';

class ShakeTrigger {
  static void startListening(Function onShake) {
    accelerometerEvents.listen((event) {
      final gForce =
          sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
      if (gForce > 20) {
        onShake();
      }
    });
  }
}
