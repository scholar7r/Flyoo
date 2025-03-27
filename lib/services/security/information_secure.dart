/// Validate if the phone number is a regular Chinese phone number
bool isValidPhoneNumber(String phoneNumber) {
  return RegExp(r'^1[3-9]\d{9}$').hasMatch(phoneNumber);
}

/// Replace the middle 4 numbers with `****`
///
/// Example:
/// ```dart
/// String securedPhoneNumber = securePhoneNumber("18888888888");
/// print(securedPhoneNumber); // 188****8888
/// ```
String securePhoneNumber(String phoneNumber) {
  if (!isValidPhoneNumber(phoneNumber)) {
    throw ArgumentError('Not a valid cell phone number');
  }
  return phoneNumber.replaceRange(3, 7, '****');
}
