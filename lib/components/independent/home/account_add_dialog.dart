import 'package:flutter/material.dart';
import 'package:flyoo/l10n/generated/app_localizations.dart';
import 'package:flyoo/models/account.dart';
import 'package:flyoo/providers/account_provider.dart';
import 'package:provider/provider.dart';

class AccountAddDialog extends StatefulWidget {
  const AccountAddDialog({super.key});

  @override
  State<AccountAddDialog> createState() => _AccountAddDialogState();
}

class _AccountAddDialogState extends State<AccountAddDialog> {
  final TextEditingController _accountAliasController = TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _accountPassController = TextEditingController();
  String? _accountAliasErrorText;
  String? _accountNameErrorText;
  String? _accountPassErrorText;

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
              child: Text(
                AppLocalizations.of(context)!.addAccount,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(AppLocalizations.of(context)!.alias),
                  errorText: _accountAliasErrorText,
                ),
                controller: _accountAliasController,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(AppLocalizations.of(context)!.userName),
                  errorText: _accountNameErrorText,
                ),
                controller: _accountNameController,
                keyboardType: TextInputType.phone,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(AppLocalizations.of(context)!.password),
                  errorText: _accountPassErrorText,
                ),
                obscureText: true,
                controller: _accountPassController,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(AppLocalizations.of(context)!.cancel),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      /////////////////////Validation///////////////////////////
                      setState(() {
                        _accountAliasErrorText =
                            _accountAliasController.text.isEmpty
                                ? AppLocalizations.of(context)!.emptyAlias
                                : null;
                        _accountNameErrorText =
                            RegExp(
                                  r'^1[3-9]\d{9}$',
                                ).hasMatch(_accountNameController.text)
                                ? null
                                : AppLocalizations.of(
                                  context,
                                )!.notRegularPhoneNumber;
                        _accountPassErrorText =
                            _accountPassController.text.isEmpty
                                ? AppLocalizations.of(context)!.emptyPassword
                                : null;
                      });

                      if (_accountAliasErrorText != null ||
                          _accountNameErrorText != null ||
                          _accountPassErrorText != null) {
                        return;
                      }

                      // int effectedLines = await DatabaseHelper().insertAccount(
                      //   Account(
                      //     accountAlias: _accountAliasController.text,
                      //     accountName: _accountNameController.text,
                      //     accountPass: md5Digest(_accountPassController.text),
                      //   ),
                      // );
                      await accountProvider.insertAccount(
                        Account(
                          accountAlias: _accountAliasController.text,
                          accountName: _accountNameController.text,
                          accountPass: _accountPassController.text,
                        ),
                      );

                      if (!context.mounted) return;
                      Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context)!.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
