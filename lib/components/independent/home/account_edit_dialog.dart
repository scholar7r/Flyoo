import 'package:flutter/material.dart';
import 'package:flyoo/models/account.dart';

class AccountEditDialog extends StatefulWidget {
  final Account account;
  const AccountEditDialog({super.key, required this.account});

  @override
  State<AccountEditDialog> createState() => _AccountEditDialogState();
}

class _AccountEditDialogState extends State<AccountEditDialog> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
