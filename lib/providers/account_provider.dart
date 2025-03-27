import 'package:flutter/widgets.dart';
import 'package:flyoo/main.dart';
import 'package:flyoo/models/account.dart';

class AccountProvider extends ChangeNotifier {
  final List<Account> _accounts = [];

  List<Account> get accounts => _accounts;

  Future<void> addAccount(Account account) async {
    await databaseHelper.insertAccount(account);
    _accounts.add(account);
    notifyListeners();
  }

  Future<void> deleteAccount(Account account) async {
    await databaseHelper.deleteAccount(account.id!);
    _accounts.removeWhere((account) => account.id == account.id);
    notifyListeners();
  }

  Future<void> loadAccounts() async {
    List<Account> accounts = await databaseHelper.queryAccounts();
    _accounts.clear();
    _accounts.addAll(accounts);
    notifyListeners();
  }
}
