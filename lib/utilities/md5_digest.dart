import 'dart:convert';

import 'package:crypto/crypto.dart';

String md5Digest(String value) {
  return md5.convert(utf8.encode(value)).toString();
}
