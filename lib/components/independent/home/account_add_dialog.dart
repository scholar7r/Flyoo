import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flyoo/l10n/app_localizations.dart';
import 'package:flyoo/main.dart';
import 'package:flyoo/models/account.dart';
import 'package:flyoo/services/database_helper.dart';

class AccountAddDialog extends StatefulWidget {
  const AccountAddDialog({super.key});

  @override
  State<AccountAddDialog> createState() => _AccountAddDialogState();
}

class _AccountAddDialogState extends State<AccountAddDialog> {
  final TextEditingController _aliasController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _digestController = TextEditingController();
  String? _aliasErrorText;
  String? _nameErrorText;
  String? _digestErrorText;

  @override
  Widget build(BuildContext context) {
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
                  errorText: _aliasErrorText,
                ),
                controller: _aliasController,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(AppLocalizations.of(context)!.userName),
                  errorText: _nameErrorText,
                ),
                controller: _nameController,
                keyboardType: TextInputType.phone,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(AppLocalizations.of(context)!.password),
                  errorText: _digestErrorText,
                ),
                obscureText: true,
                controller: _digestController,
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
                        _aliasErrorText =
                            _aliasController.text.isEmpty
                                ? AppLocalizations.of(context)!.emptyAlias
                                : null;
                        _nameErrorText =
                            RegExp(
                                  r'^1[3-9]\d{9}$',
                                ).hasMatch(_nameController.text)
                                ? null
                                : AppLocalizations.of(
                                  context,
                                )!.notRegularPhoneNumber;
                        _digestErrorText =
                            _digestController.text.isEmpty
                                ? AppLocalizations.of(context)!.emptyPassword
                                : null;
                      });

                      if (_aliasErrorText != null ||
                          _nameErrorText != null ||
                          _digestErrorText != null) {
                        return;
                      }
                      //////////////////////////////////////////////////////////
                      String alias = _aliasController.text;
                      String name = _nameController.text;
                      String digest =
                          md5
                              .convert(utf8.encode(_digestController.text))
                              .toString();

                      int effectedLines = await DatabaseHelper().insertAccount(
                        Account(alias: alias, name: name, digest: digest)
                      );

                      if (effectedLines > 0) {
                        logger.i('Insert a new account successed');
                      } else {
                        logger.e('Insert a new account is failed');
                      }

                      if (!context.mounted) return;
                      Navigator.pop(context, true);
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
