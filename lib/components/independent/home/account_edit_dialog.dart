import 'package:flutter/material.dart';
import 'package:flyoo/l10n/generated/app_localizations.dart';
import 'package:flyoo/models/account.dart';

class AccountEditDialog extends StatelessWidget {
  final Account account;
  const AccountEditDialog({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.edit),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.alias),
                border: OutlineInputBorder(),
              ),
            ),

            TextField(
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.userName),
                border: OutlineInputBorder(),
              ),
            ),

            TextField(
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.password),
                border: OutlineInputBorder(),
              ),
            ),

            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.cancel),
                ),

                ElevatedButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.save),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
