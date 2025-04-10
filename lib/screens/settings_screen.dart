import 'package:flutter/material.dart';
import 'package:flyoo/l10n/generated/app_localizations.dart';
import 'package:flyoo/screens/settings_screens/network_settings_screen.dart';
import 'package:flyoo/screens/settings_screens/preferences_settings_screen.dart';
import 'package:flyoo/screens/settings_screens/sync_settings_screen.dart';
import 'package:flyoo/screens/settings_screens/theme_settings_screen.dart';
import 'package:flyoo/utilities/web_url_launcher.dart';

class SettingsItemList extends StatelessWidget {
  const SettingsItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(AppLocalizations.of(context)!.preferences),
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreferencesSettingsScreen()),
              ),
        ),

        ListTile(
          leading: Icon(Icons.web),
          title: Text(AppLocalizations.of(context)!.theme),
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThemeSettingsScreen()),
              ),
        ),

        ListTile(
          leading: Icon(Icons.api),
          title: Text(AppLocalizations.of(context)!.network),
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NetworkSettingsScreen()),
              ),
        ),

        ListTile(
          leading: Icon(Icons.backup),
          title: Text(AppLocalizations.of(context)!.backup_sync),
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SyncSettingsScreen()),
              ),
        ),

        ListTile(
          leading: Icon(Icons.info),
          title: Text(AppLocalizations.of(context)!.about),
          onTap:
              () => showAboutDialog(
                context: context,
                applicationName: "Flyoo",
                applicationVersion: "0.1.0",
                applicationLegalese: AppLocalizations.of(context)!.legalese,
              ),
        ),
      ],
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
        actions: [
          IconButton(
            onPressed: () => launchWebUrl("https://t.me/flyoo_pub"),
            icon: Icon(Icons.telegram),
            tooltip: AppLocalizations.of(context)!.joinGroup,
          ),
        ],
      ),

      body: SettingsItemList(),
    );
  }
}
