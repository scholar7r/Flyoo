import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  // The default locale will use the language in the current device
  Locale _locale = PlatformDispatcher.instance.locale;
  bool _enableReplaceSensitive = true;

  PreferencesProvider() {
    _loadLocale();
  }

  bool get enableReplaceSensitive => _enableReplaceSensitive;
  Locale get locale => _locale;

  Future<void> setEnableReplaceSensitive(bool value) async {
    _enableReplaceSensitive = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('enableReplaceSensitive', value);
    notifyListeners();
  }
  
  Future<void> setLocale(String languageCode) async {
    _locale = Locale(languageCode);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('languageCode');

    if (languageCode != null) {
      _locale = Locale(languageCode);
    } else {
      _locale = PlatformDispatcher.instance.locale;
    }

    notifyListeners();
  }
}
