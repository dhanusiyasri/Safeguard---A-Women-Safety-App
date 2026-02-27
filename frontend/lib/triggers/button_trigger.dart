import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class ButtonTrigger {
  final VoidCallback onTriggered;

  static const MethodChannel _channel = MethodChannel('volume_button_channel');

  int _pressCount = 0;
  Timer? _timer;

  ButtonTrigger({required this.onTriggered});

  void start() {
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  Future<void> _handleMethodCall(MethodCall call) async {
    if (call.method == "volumeDown") {
      _pressCount++;

      debugPrint("🔘 Volume Down pressed $_pressCount times");

      _timer ??= Timer(const Duration(seconds: 5), _reset);

      if (_pressCount >= 3) {
        debugPrint("🚨 Button trigger ACTIVATED");
        onTriggered();
        _reset();
      }
    }
  }

  void _reset() {
    _pressCount = 0;
    _timer?.cancel();
    _timer = null;
  }
}
