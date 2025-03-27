// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AppearanceProvider extends ChangeNotifier {
//   bool _isDarkMode = false;

//   AppearanceProvider() {
//     _loadTheme();
//   }

//   bool get isDarkMode => _isDarkMode;

//   Future<void> setIsDarkMode(bool value) async {
//     _isDarkMode = value;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isDarkMode', value);
//     notifyListeners();
//   }

//   Future<void> _loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     _isDarkMode = prefs.getBool('isDarkMode') ?? false;
//     notifyListeners();
//   }
// }
