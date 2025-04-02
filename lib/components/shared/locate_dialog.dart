import 'package:flutter/material.dart';
import 'package:flyoo/l10n/generated/app_localizations.dart';
import 'package:flyoo/models/account.dart';

class LocateDialog extends StatefulWidget {
  final Account account;
  const LocateDialog({super.key, required this.account});

  @override
  State<LocateDialog> createState() => _LocateDialogState();
}

class _LocateDialogState extends State<LocateDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.locate),
    );
  }
}
