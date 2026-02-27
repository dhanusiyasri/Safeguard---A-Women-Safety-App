import 'dart:async';
import 'package:flutter/material.dart';
import 'shake_trigger.dart';
import 'button_trigger.dart';

class TriggerManager {
  final BuildContext context;

  late ShakeTrigger shakeTrigger;
  late ButtonTrigger buttonTrigger;

  Timer? _dialogTimer;
  bool _userResponded = false;

  TriggerManager(this.context);

  void initialize() {
  shakeTrigger = ShakeTrigger(onTriggered: () {
    _showPopup("SHAKE");
  });

  buttonTrigger = ButtonTrigger(onTriggered: () {
    _showPopup("BUTTON");
  });

  shakeTrigger.start();
  buttonTrigger.start();

  debugPrint("✅ TriggerManager Initialized");
}


  void _showPopup(String type) {
    debugPrint("🚨 Danger(${type}_TRIGGERED)");

    _userResponded = false;

    _dialogTimer?.cancel();
    _dialogTimer = Timer(const Duration(seconds: 10), () {
      if (!_userResponded) {
        debugPrint("⚠️ DANGER — SOS CONFIRMED");
        Navigator.of(context, rootNavigator: true).pop();
      }
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("⚠️ Alert"),
        content: const Text("Are you safe?"),
        actions: [
          TextButton(
            onPressed: () {
              _userResponded = true;
              _dialogTimer?.cancel();
              Navigator.pop(context);
              debugPrint("User is SAFE");
            },
            child: const Text("YES"),
          ),
          TextButton(
            onPressed: () {
              _userResponded = true;
              _dialogTimer?.cancel();
              Navigator.pop(context);
              debugPrint("Need HELP!! 🚨 SOS CONFIRMED");
            },
            child: const Text(
              "NO",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}