import 'package:flutter/material.dart';
import 'package:flyoo/l10n/generated/app_localizations.dart';
import 'package:flyoo/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class NetworkSettingsScreen extends StatelessWidget {
  const NetworkSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.network)),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.api),
            title: Text(AppLocalizations.of(context)!.builtinEndpoints),
            subtitle: Text(
              AppLocalizations.of(context)!.bulitinEndpointsDecription,
            ),
            trailing: Switch(
              value: settingsProvider.useBuiltinEndpoints,
              onChanged: (value) {
                settingsProvider.setUseBuiltinEndpoints(value);
              },
            ),
          ),

          Divider(height: 0),

          // TODO: Here should be a list of textfields for users to put there
          // custom API endpoints in.
          _buildCustomEndpointTile(
            context,
            AppLocalizations.of(context)!.login,
            "https://example.org/login",
            settingsProvider,
          ),
          _buildCustomEndpointTile(
            context,
            AppLocalizations.of(context)!.accountDetail,
            "https://example.org/account",
            settingsProvider,
          ),
          _buildCustomEndpointTile(
            context,
            AppLocalizations.of(context)!.clockInAndClockOut,
            "https://example.org/clock",
            settingsProvider,
          ),
          _buildCustomEndpointTile(
            context,
            AppLocalizations.of(context)!.logs,
            "https://example.org/logs",
            settingsProvider,
          ),
          _buildCustomEndpointTile(
            context,
            AppLocalizations.of(context)!.attendance,
            "https://example.org/history",
            settingsProvider,
          ),
        ],
      ),
    );
  }

  // Helper function to build a ListTile with disabled state if built-in endpoints are enabled
  Widget _buildCustomEndpointTile(
    BuildContext context,
    String title,
    String subtitle,
    SettingsProvider settingsProvider,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      enabled:
          !settingsProvider
              .useBuiltinEndpoints, // Disable the tile if built-in endpoints are enabled
      onTap: () {
        if (!settingsProvider.useBuiltinEndpoints) {
          // Handle the custom API endpoint tap action here
        }
      },
    );
  }
}
