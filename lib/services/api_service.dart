import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> testConnection() async {
    final response = await http.get(Uri.parse("${ApiConfig.baseUrl}/api/ping"));
    if (response.statusCode == 200) {
      print("Connected to backend: ${response.body}");
    } else {
      print(" Backend error: ${response.statusCode}");
    }
  }
}