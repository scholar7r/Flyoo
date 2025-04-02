import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Export all keys and values in shared preferences
Future<String> exportPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final keys = prefs.getKeys();

  final data = <String, dynamic>{};
  for (var key in keys) {
    data[key] = prefs.get(key);
  }

  return jsonEncode(data);
}