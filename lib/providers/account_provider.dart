import 'package:flutter/material.dart';
import 'package:flyoo/main.dart';
import 'package:flyoo/models/account.dart';

class AccountProvider extends ChangeNotifier {
  List<Account> _accounts = [];

  AccountProvider() {
    _queryAccounts();
  }

  List<Account> get accounts => _accounts;

  Future<void> deleteAccount(int id) async {
    await databaseHelper.deleteAccount(id);
    _queryAccounts();
  }

  Future<void> insertAccount(Account account) async {
    await databaseHelper.insertAccount(account);
    _queryAccounts();
  }

  Future<void> _queryAccounts() async {
    _accounts = await databaseHelper.queryAccounts();
    notifyListeners();
  }
}
