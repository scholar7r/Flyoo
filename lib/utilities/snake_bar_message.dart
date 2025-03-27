import 'package:flutter/material.dart';

showSnakeBarMessage(BuildContext context, String message, Duration duration) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: duration,
    )
  );
}