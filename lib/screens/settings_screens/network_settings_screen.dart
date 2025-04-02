import 'package:flutter/material.dart';
import 'package:flyoo/l10n/generated/app_localizations.dart';
import 'package:flyoo/providers/endpoints_provider.dart';
import 'package:flyoo/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class NetworkSettingsScreen extends StatelessWidget {
  const NetworkSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final endpointsProvider = Provider.of<EndpointsProvider>(context);

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

          _buildCustomEndpointTile(
            context,
            AppLocalizations.of(context)!.login,
            endpointsProvider.accountLogin,
            settingsProvider,
          ),
          _buildCustomEndpointTile(
            context,
            AppLocalizations.of(context)!.accountDetail,
            endpointsProvider.accountDetail,
            settingsProvider,
          ),
          _buildCustomEndpointTile(
            context,
            AppLocalizations.of(context)!.clockInAndClockOut,
            endpointsProvider.accountClock,
            settingsProvider,
          ),
          _buildCustomEndpointTile(
            context,
            AppLocalizations.of(context)!.logs,
            endpointsProvider.accountLogPush,
            settingsProvider,
          ),
          _buildCustomEndpointTile(
            context,
            AppLocalizations.of(context)!.attendance,
            endpointsProvider.accountAttendance,
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
