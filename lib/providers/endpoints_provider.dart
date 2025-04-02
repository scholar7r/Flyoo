import 'package:flutter/material.dart';

/// Provide endpoints s
class EndpointsProvider extends ChangeNotifier {
  final String _accountLogin = "ACCOUNT_LOGIN";
  final String _accountDetail = "ACCOUNT_DETAIL";
  final String _accountClock = "ACCOUNT_CLOCK";
  final String _accountLogPush = "ACCOUNT_LOG_PUSH";
  final String _accountAttendance = "ACCOUNT_ATTENDANCE";
  final String _imageUpload = "IMAGE_UPLOAD";

  String get accountAttendance => _accountAttendance;
  String get accountClock => _accountClock;
  String get accountDetail => _accountDetail;
  String get accountLogin => _accountLogin;
  String get accountLogPush => _accountLogPush;
  String get imageUpload => _imageUpload;

  Future<void> setAccountAttendance(String value) async {}

  Future<void> setAccountClock(String value) async {}

  Future<void> setAccountDetail(String value) async {}

  Future<void> setAccountLogin(String value) async {}

  Future<void> setAccountLogPush(String value) async {}

  Future<void> setImageUpload(String value) async {}
}
