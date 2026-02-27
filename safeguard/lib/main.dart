import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
//import 'services/background_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

Future<void> requestLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception("Location permission permanently denied");
  }
}


Future<void> requestPermissions() async {
  await [
    Permission.location,
    Permission.sms,
  ].request();
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await BackgroundService.initialize();
 await requestLocationPermission();

Position pos = await Geolocator.getCurrentPosition(
  desiredAccuracy: LocationAccuracy.high,
);

  runApp(const SafeGuardApp());
}

class SafeGuardApp extends StatelessWidget {
  const SafeGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeGuard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomeScreen(),
    );
  }
}
