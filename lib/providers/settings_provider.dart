import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  final SharedPreferences _prefs;

  bool _sensitiveVisible = true;
  bool _useBuiltinEndpoints = true;
  String _languageCode = "zh";
  ThemeMode _themeMode = ThemeMode.system;

  SettingsProvider(this._prefs) {
    _initializePreferences();
  }

  String get languageCode => _languageCode;
  bool get sensitiveVisible => _sensitiveVisible;
  ThemeMode get themeMode => _themeMode;
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

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _prefs.setString("themeMode", mode.name);
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
    String themeModeString =
        _prefs.getString("themeMode") ?? ThemeMode.system.name;
    _themeMode = ThemeMode.values.firstWhere(
      (e) => e.name == themeModeString,
      orElse: () => ThemeMode.system,
    );
    notifyListeners();
  }
}
