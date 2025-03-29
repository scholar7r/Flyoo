import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  final SharedPreferences _prefs;

  bool _sensitiveVisible = true;
  bool _useBuiltinEndpoints = true;
  String _languageCode = "zh";

  SettingsProvider(this._prefs) {
    _initializePreferences();
  }

  String get languageCode => _languageCode;
  bool get sensitiveVisible => _sensitiveVisible;
  bool get useBuiltinEndpoints => _useBuiltinEndpoints;

  Future<void> setLanguageCode(String value) async {
    _languageCode = value;
    await _prefs.setString("languageCode", value);
    notifyListeners();
  }

  Future<void> setSensitiveVisible(bool value) async {
    _sensitiveVisible = value;
    await _prefs.setBool("sensitiveVisible", value);
    notifyListeners();
  }

  Future<void> setUseBuiltinEndpoints(bool value) async {
    _useBuiltinEndpoints = value;
    await _prefs.setBool("useBuiltinEndpoints", value);
    notifyListeners();
  }

  Future<void> _initializePreferences() async {
    _languageCode = _prefs.getString("languageCode") ?? "zh";
    _sensitiveVisible = _prefs.getBool("sensitiveVisible") ?? true;
    _useBuiltinEndpoints = _prefs.getBool("useBuiltinEndpoints") ?? true;
    notifyListeners();
  }
}
