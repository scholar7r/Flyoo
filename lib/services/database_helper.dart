import 'package:flyoo/models/account.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// sqflite database helper
class DatabaseHelper {
  final String databaseFileName = "flyoo.db";
  final String table = "Account";

  Database? database;

  Future<int> deleteAccount(int id) async {
    if (database == null) await openFlyooDatabase();
    return database!.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  /// insertAccount inserts a new account object to the table named `Account`
  /// and returns the number of modified lines
  Future<int> insertAccount(Account account) async {
    await openFlyooDatabase();
    return await database!.insert(table, {
      'alias': account.alias,
      'name': account.name,
      'digest': account.digest,
    });
  }

  /// openFlyooDatabase opens database for Flyoo (this software)
  ///
  /// This function is recommend to use in the `main` function because it does
  /// initialize the database for this software
  Future<void> openFlyooDatabase() async {
    String databaseFilePath = "${await getDatabasesPath()}/$databaseFileName";
    // Validate the variable `database` is exists, if it's null or empty, run
    // the function `openDatabase` to gain a new `Database` object.
    database ??= await openDatabase(
      databaseFilePath,
      version: 1,
      // Create a table named `Account` for the first time this software launches
      onCreate: (db, version) async {
        await db.execute('''
CREATE TABLE Account (
  id      INTEGER PRIMARY KEY,
  alias   TEXT NOT NULL,
  name    TEXT NOT NULL,
  digest  TEXT NOT NULL
);
''');
      },
    );
  }

  Future<List<Account>> queryAccounts() async {
    if (database == null) await openFlyooDatabase();
    List<Map<String, dynamic>> accounts = await database!.query(table);
    return accounts
        .map(
          (account) => Account(
            id: account['id'] as int,
            alias: account['alias'] as String,
            name: account['name'] as String,
            digest: account['digest'] as String,
          ),
        )
        .toList();
  }
}
