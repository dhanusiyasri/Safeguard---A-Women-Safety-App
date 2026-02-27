import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';


class ApiService {

  static const String baseUrl = "http://10.186.161.91:8000";

 
  static const String sosEndpoint = "/sos/trigger";


  static Future<bool> sendSOS({
    required int userId,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl$sosEndpoint"),
        headers: {
         "Content-Type": "application/json",
         "X-API-KEY": "safeguard123",
        },
        body: jsonEncode({
          "user_id": userId,
          "latitude": latitude,
          "longitude": longitude,
        }),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        return true;
      } else {
        debugPrint(
          "SOS API failed → ${response.statusCode}: ${response.body}",
        );
        return false;
      }
    } catch (e) {
      debugPrint("SOS API exception → $e");
      return false;
    }
  }
}
