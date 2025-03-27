import 'package:flutter/material.dart';
import 'package:flyoo/l10n/app_localizations.dart';
import 'package:flyoo/l10n/language.dart';
import 'package:flyoo/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

class PreferencesSettingsScreen extends StatefulWidget {
  const PreferencesSettingsScreen({super.key});

  @override
  State<PreferencesSettingsScreen> createState() =>
      _PreferencesSettingsScreenState();
}

class _PreferencesSettingsScreenState extends State<PreferencesSettingsScreen> {
  late String _selectedLanguageCode;

  @override
  Widget build(BuildContext context) {
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.preferences)),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text(AppLocalizations.of(context)!.language),
            subtitle: Text(
              Language.locales[preferencesProvider.locale.languageCode]!,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text(AppLocalizations.of(context)!.language),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            Language.locales.entries.map((locale) {
                              return RadioListTile<String>(
                                value: locale.key,
                                title: Text(locale.value),
                                groupValue: _selectedLanguageCode,
                                onChanged: (value) {
                                  preferencesProvider.setLocale(value!);
                                  Navigator.pop(context);
                                },
                              );
                            }).toList(),
                      ),
                    ),
              );
            },
          ),

          Divider(height: 0),

          ListTile(
            leading: Icon(Icons.security),
            title: Text(AppLocalizations.of(context)!.replaceAccountDetail),
            trailing: Switch(
              value: preferencesProvider.enableReplaceSensitive,
              onChanged:
                  (value) =>
                      preferencesProvider.setEnableReplaceSensitive(value),
            ),
          ),

          Divider(height: 0),
        ],
      ),
    );
  }

  /// didChangeDependencies callback function will be executed when the first
  /// time that the componet build or the dependencies has been changed.
  /// By using this callback function, it's more smart to get the languageCode
  /// currently using, and will not use to much memory.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLanguageCode = Localizations.localeOf(context).languageCode;
  }
}
