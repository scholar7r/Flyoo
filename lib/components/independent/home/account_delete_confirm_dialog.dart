import 'package:flutter/material.dart';
import 'package:flyoo/l10n/app_localizations.dart';
import 'package:flyoo/models/account.dart';
import 'package:flyoo/providers/account_provider.dart';
import 'package:provider/provider.dart';

class AccountDeleteConfirmDialog extends StatelessWidget {
  final Account account;

  const AccountDeleteConfirmDialog({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(AppLocalizations.of(context)!.accountDeleteConfirm),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 12,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)!.cancel),
                ),
            
                FilledButton(
                  onPressed: () async {
                    // Delete target account and refresh accounts
                    await accountProvider.deleteAccount(account);
                    await accountProvider.loadAccounts();

                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.confirm),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
