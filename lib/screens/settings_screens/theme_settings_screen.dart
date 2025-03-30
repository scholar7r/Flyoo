import 'package:flutter/material.dart';
import 'package:flyoo/l10n/generated/app_localizations.dart';
import 'package:flyoo/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    final themeModeLabels = {
      ThemeMode.system: AppLocalizations.of(context)!.followSystem,
      ThemeMode.dark: AppLocalizations.of(context)!.darkMode,
      ThemeMode.light: AppLocalizations.of(context)!.lightMode,
    };

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.theme)),
      body: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.theme),
            subtitle: Text(themeModeLabels[settingsProvider.themeMode]!),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(AppLocalizations.of(context)!.theme),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          ThemeMode.values.map((mode) {
                            return RadioListTile(
                              title: Text(themeModeLabels[mode]!),
                              value: mode,
                              groupValue: settingsProvider.themeMode,
                              onChanged: (value) {
                                settingsProvider.setThemeMode(value!);
                                Navigator.pop(context);
                              },
                            );
                          }).toList(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
