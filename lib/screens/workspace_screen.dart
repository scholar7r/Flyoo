import 'package:flutter/material.dart';
import 'package:flyoo/components/independent/workspace/image_uploader.dart';
import 'package:flyoo/l10n/generated/app_localizations.dart';
import 'package:flyoo/providers/account_provider.dart';
import 'package:flyoo/providers/settings_provider.dart';
import 'package:flyoo/services/security/information_secure.dart';
import 'package:provider/provider.dart';

class WorkspaceScreen extends StatefulWidget {
  const WorkspaceScreen({super.key});

  @override
  State<WorkspaceScreen> createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {
  // ! DON'T CHANGE THIS VARIABLE VALUE FROM 1 TO ZERO OR OTHER NUMBERS, THIS
  // WILL BROKE THE FUCKING DropdownButtonFieldForm !
  // Ah, don't worry about this value 1 will outbounds of index, because if the
  // _accounts is empty, it will not reder the DropdownButtonFieldForm.
  int _selectedAccountId = 1;
  int _selectedLogTypeChipIndex = 0;
  int _selectedPrivilegeChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);

    // Provide types for logs, and
    final List<String> logTypeChipLabels = [
      AppLocalizations.of(context)!.dailyLog,
      AppLocalizations.of(context)!.weeklyLog,
      AppLocalizations.of(context)!.monthlyLog,
    ];
    final List<String> visibilityTypeChipLabels = [
      AppLocalizations.of(context)!.visibilityLow,
      AppLocalizations.of(context)!.visibilityMiddle,
      AppLocalizations.of(context)!.visibilityHigh,
    ];

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.workspace)),
      body:
          accountProvider.accounts.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_queue, size: 64),
                    Text(AppLocalizations.of(context)!.noAvailableAccount),
                    Text(AppLocalizations.of(context)!.addAcountTip),
                  ],
                ),
              )
              : ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: DropdownButtonFormField<int>(
                      value: _selectedAccountId,
                      items:
                          accountProvider.accounts.map((account) {
                            return DropdownMenuItem<int>(
                              value: account.id,
                              child: Text(
                                "${account.accountAlias} - ${settingsProvider.sensitiveVisible ? securePhoneNumber(account.accountName) : account.accountName}",
                              ),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedAccountId = value!;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.account),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: Text(AppLocalizations.of(context)!.title),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      runSpacing: 8,
                      children: List.generate(logTypeChipLabels.length, (
                        index,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(logTypeChipLabels[index]),
                            selected: _selectedLogTypeChipIndex == index,
                            onSelected: (bool selected) {
                              if (selected) {
                                setState(() {
                                  _selectedLogTypeChipIndex = index;
                                });
                              }
                            },
                          ),
                        );
                      }),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: Text(
                          AppLocalizations.of(context)!.contentOrPrompt,
                        ),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 10,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(spacing: 12, children: [ImageUploader()]),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      runSpacing: 8,
                      children: List.generate(visibilityTypeChipLabels.length, (
                        index,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(visibilityTypeChipLabels[index]),
                            selected: _selectedPrivilegeChipIndex == index,
                            onSelected: (bool selected) {
                              if (selected) {
                                setState(() {
                                  _selectedPrivilegeChipIndex = index;
                                });
                              }
                            },
                          ),
                        );
                      }),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      runSpacing: 8,
                      alignment: WrapAlignment.end,
                      spacing: 12,
                      children: [
                        FilledButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 12,
                            children: [
                              Icon(Icons.auto_awesome),
                              Text(
                                AppLocalizations.of(context)!.generateContent,
                              ),
                            ],
                          ),
                        ),

                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                AppLocalizations.of(context)!.saveAsDraft,
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {},
                              child: Text(AppLocalizations.of(context)!.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
