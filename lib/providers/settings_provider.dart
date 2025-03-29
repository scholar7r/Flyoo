import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _sensitiveVisible = true;
  bool _useBuiltinEndpoints = true;

  String _languageCode = "zh";

  String get languageCode => _languageCode;

  bool get sensitiveVisible => _sensitiveVisible;
  bool get useBuiltinEndpoints => _useBuiltinEndpoints;

  void setLanguageCode(String value) {
    _languageCode = value;
    notifyListeners();
  }

  void setSensitiveVisible(bool value) {
    _sensitiveVisible = value;
    notifyListeners();
  }

  void setUseBuiltinEndpoints(bool value) {
    _useBuiltinEndpoints = value;
    notifyListeners();
  }
}
