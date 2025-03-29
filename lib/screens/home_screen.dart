import 'package:flutter/material.dart';
import 'package:flyoo/components/independent/home/account_add_dialog.dart';
import 'package:flyoo/components/independent/home/account_card.dart';
import 'package:flyoo/l10n/generated/app_localizations.dart';
import 'package:flyoo/providers/account_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.home)),
      body: Padding(
        // Note: Avoid using `EdgeInsets.all()`, as it adds an unwanted border effect.
        padding: EdgeInsets.symmetric(horizontal: 8),
        child:
            // Check this _accounts is empty or not, if it's empty, show a tip,
            // or use ListView to show `AccountCard` for each account
            accountProvider.accounts.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_queue, size: 64),
                      Text(AppLocalizations.of(context)!.noAvailableAccount),
                    ],
                  ),
                )
                : ListView.builder(
                  itemCount: accountProvider.accounts.length,
                  itemBuilder: (context, index) {
                    return AccountCard(
                      account: accountProvider.accounts[index],
                    );
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Show a dialog that user could edit informations about a new account
          await showDialog(
            context: context,
            builder: (context) => AccountAddDialog(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
