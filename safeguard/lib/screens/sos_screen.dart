import 'package:flutter/material.dart';
import '../services/location_service.dart';
import '../services/api_service.dart';
import '../services/sms_service.dart';
import '../triggers/shake_trigger.dart';
import 'package:geolocator/geolocator.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  bool sosSent = false;
  String emergencyNumber = "9876543210"; // <-- replace with your test number
  bool isLoading = false;
  
  @override
  void initState() {
    super.initState();

    // Start listening for shake trigger
    ShakeTrigger.startListening(() {
      if (!sosSent && !isLoading) {
        triggerSOS();
      }
    });
  }
  Future<Position?> getLocationWithTimeout() async {
  try {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).timeout(const Duration(seconds: 8));
  } catch (e) {
    // Fallback to last known location
    return await Geolocator.getLastKnownPosition();
  }
}


  Future<void> triggerSOS() async {
  setState(() {
    isLoading = true;
  });

  // 1. Send fast SOS first
  await SmsService.sendSMS(
    emergencyNumber,
    "🚨 SOS! Emergency! I need help...."
  );

  // 2. Get location (with timeout)
  Position? pos = await getLocationWithTimeout();

  if (pos != null) {
    await SmsService.sendSMS(
      emergencyNumber,
      "📍 My location: https://maps.google.com/?q=${pos.latitude},${pos.longitude}"
    );
  } else {
    await SmsService.sendSMS(
      emergencyNumber,
      "⚠️ Could not fetch GPS location. Please call me immediately!"
    );
  }

  setState(() {
    isLoading = false;
  });

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("SOS sent successfully"))
  );
}



  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: Center(
        child: GestureDetector(
          onTap: (!sosSent && !isLoading) ? triggerSOS : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              color: sosSent
                  ? Colors.grey
                  : isLoading
                      ? Colors.orange
                      : Colors.red,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.6),
                  blurRadius: 25,
                  spreadRadius: 5,
                )
              ],
            ),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 4,
                    )
                  : Text(
                      sosSent ? "SENT" : "SOS",
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
