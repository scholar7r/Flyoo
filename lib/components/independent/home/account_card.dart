import 'package:flutter/material.dart';
import 'package:flyoo/components/independent/home/account_delete_confirm_dialog.dart';
import 'package:flyoo/components/independent/home/account_edit_dialog.dart';
import 'package:flyoo/components/independent/home/attendance_dialog.dart';
import 'package:flyoo/components/shared/locate_dialog.dart';
import 'package:flyoo/l10n/app_localizations.dart';
import 'package:flyoo/models/account.dart';
import 'package:flyoo/providers/preferences_provider.dart';
import 'package:flyoo/services/security/information_secure.dart';
import 'package:provider/provider.dart';

class AccountCard extends StatefulWidget {
  final Account account;

  const AccountCard({super.key, required this.account});

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  bool _isClockPending = false;
  bool _isClockIn = true;

  @override
  Widget build(BuildContext context) {
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.account.alias,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  preferencesProvider.enableReplaceSensitive
                      ? securePhoneNumber(widget.account.name)
                      : widget.account.name,
                ),
              ],
            ),

            Row(
              children: [
                // This IconButton provides a way to act the clock-in event
                IconButton(
                  onPressed: () async {
                    setState(() {
                      _isClockPending = !_isClockPending;
                    });

                    await Future.delayed(Durations.extralong4);

                    setState(() {
                      _isClockPending = !_isClockPending;
                      _isClockIn = !_isClockIn;
                    });
                  },
                  icon:
                      _isClockPending
                          ? CircularProgressIndicator(
                            constraints: BoxConstraints.tight(Size.square(24)),
                          )
                          : _isClockIn
                          ? Icon(Icons.flag)
                          : Icon(Icons.tour),
                  tooltip:
                      _isClockIn
                          ? AppLocalizations.of(context)!.clockIn
                          : AppLocalizations.of(context)!.clockOut,
                ),

                // This PopupMenuButton provides more functional buttons, like
                // edit and delete inside.
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case "locate":
                        showDialog(
                          context: context,
                          builder: (context) {
                            return LocateDialog(account: widget.account);
                          },
                        );
                        break;

                      case "edit":
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AccountEditDialog(account: widget.account);
                          },
                        );
                        break;

                      case "attendance":
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AttendanceDialog(account: widget.account);
                          },
                        );
                        break;

                      case "delete":
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AccountDeleteConfirmDialog(
                              account: widget.account,
                            );
                          },
                        );
                        break;
                    }
                  },
                  itemBuilder:
                      (context) => [
                        PopupMenuItem(
                          value: "locate",
                          child: Row(
                            spacing: 12,
                            children: [
                              Icon(Icons.location_on),
                              Text(AppLocalizations.of(context)!.locate),
                            ],
                          ),
                        ),

                        PopupMenuItem(
                          value: "edit",
                          child: Row(
                            spacing: 12,
                            children: [
                              Icon(Icons.edit),
                              Text(AppLocalizations.of(context)!.edit),
                            ],
                          ),
                        ),

                        PopupMenuItem(
                          value: "attendance",
                          child: Row(
                            spacing: 12,
                            children: [
                              Icon(Icons.calendar_month),
                              Text(AppLocalizations.of(context)!.attendance),
                            ],
                          ),
                        ),

                        PopupMenuItem(
                          value: "delete",
                          child: Row(
                            spacing: 12,
                            children: [
                              Icon(Icons.delete),
                              Text(AppLocalizations.of(context)!.delete),
                            ],
                          ),
                        ),
                      ],
                  icon: Icon(Icons.more_vert),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
