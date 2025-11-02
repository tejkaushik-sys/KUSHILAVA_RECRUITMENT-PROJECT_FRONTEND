// Loads theme JSON from assets (which references online assets)
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/theme_model.dart';

class ThemeLoader {
  static Future<ThemeModel> loadGlobal() async {
    final raw = await rootBundle.loadString('assets/themes/global.json');
    final Map<String, dynamic> j = jsonDecode(raw);
    return ThemeModel.fromJson(j);
  }
}