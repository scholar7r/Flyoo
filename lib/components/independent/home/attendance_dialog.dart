import 'package:flutter/material.dart';
import 'package:flyoo/models/account.dart';

class AttendanceDialog extends StatefulWidget {
  final Account account;
  const AttendanceDialog({super.key, required this.account});

  @override
  State<AttendanceDialog> createState() => _AttendanceDialogState();
}

class _AttendanceDialogState extends State<AttendanceDialog> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
