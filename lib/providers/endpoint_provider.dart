import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EndpointProvider extends ChangeNotifier {
  // Enable builtin endpoints for default
  bool _enableBuiltinEndpoints = true;

  EndpointProvider() {
    _loadSettings();
  }

  bool get enableBuiltinEndpoints => _enableBuiltinEndpoints;

  // Set the value for builtin endpoints and persist it
  Future<void> setBuiltinEndpoints(bool value) async {
    _enableBuiltinEndpoints = value;

    // Save the value to shared preferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('enableBuiltinEndpoints', value);

    notifyListeners();
  }

  // Load settings from shared preferences
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _enableBuiltinEndpoints = prefs.getBool('enableBuiltinEndpoints') ?? true;
    notifyListeners();
  }
}
