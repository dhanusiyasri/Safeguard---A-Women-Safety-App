import 'package:geolocator/geolocator.dart';

class LocationService {
  static double? lastLat;
  static double? lastLng;

  static Future<Position> getCurrentLocation() async {
    bool enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) throw "Location disabled";

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    final pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    lastLat = pos.latitude;
    lastLng = pos.longitude;

    return pos;
  }
}
