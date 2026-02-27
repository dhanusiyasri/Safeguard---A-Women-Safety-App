import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ShakeTrigger {
  final VoidCallback onTriggered;

  int _shakeCount = 0;
  Timer? _timer;

  ShakeTrigger({required this.onTriggered});

  void start() {
    accelerometerEvents.listen((event) {
      final double magnitude =
          event.x * event.x + event.y * event.y + event.z * event.z;

      if (magnitude > 200) {
        _shakeCount++;

        _timer ??= Timer(const Duration(seconds: 5), _reset);

        if (_shakeCount >= 3) {
          onTriggered();
          _reset();
        }
      }
    });
  }

  void _reset() {
    _shakeCount = 0;
    _timer?.cancel();
    _timer = null;
  }
}