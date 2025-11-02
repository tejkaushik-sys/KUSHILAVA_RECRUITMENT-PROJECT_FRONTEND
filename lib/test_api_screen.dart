import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const baseUrl = "http://10.0.2.2:4000";

  static Future<List<dynamic>> getRecipes() async {
    final response = await http.get(Uri.parse('$baseUrl/api/recipes'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}