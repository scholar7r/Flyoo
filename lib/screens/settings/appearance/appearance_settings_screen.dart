import 'package:flutter/material.dart';
import 'package:flyoo/l10n/app_localizations.dart';

class AppearanceSettingsScreen extends StatelessWidget {
  const AppearanceSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final appearanceProvider = Provider.of<AppearanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appearance)),
      // body: ListView(
      //   children: [
      //     ListTile(
      //       leading: Icon(Icons.tonality),
      //       title: Text(AppLocalizations.of(context)!.darkMode),
      //       trailing: Switch(
      //         value: appearanceProvider.isDarkMode,
      //         onChanged: (value) => appearanceProvider.setIsDarkMode(value),
      //       ),
      //     ),

      //     Divider(height: 0),
      //   ],
      // ),
      body: Placeholder(),
    );
  }
}
