import 'package:flutter/material.dart';
import 'package:flyoo/l10n/app_localizations.dart';

class SyncSettingsScreen extends StatelessWidget {
  final bool _isServiceAlive = false;
  const SyncSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.backup_sync)),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("scholar7r@outlook.com"),
            subtitle: Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.circle,
                  size: 14,
                  color: _isServiceAlive ? Colors.green : Colors.red,
                ),
                Text("WebDAV"),
              ],
            ),
            trailing: FilledButton(
              onPressed:
                  () => showDialog(
                    context: context,
                    builder: (context) => const Placeholder(),
                  ),
              child: Text(AppLocalizations.of(context)!.edit),
            ),
          ),

          ListTile(
            leading: Icon(Icons.backup),
            title: Text(AppLocalizations.of(context)!.backup),
            subtitle: Text(AppLocalizations.of(context)!.backupDescription),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.cloud_download),
            title: Text(AppLocalizations.of(context)!.restore),
            subtitle: Text(AppLocalizations.of(context)!.restoreDescription),
            onTap: () {},
          ),

          Divider(height: 0),
        ],
      ),
    );
  }
}
