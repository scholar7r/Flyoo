import 'package:flyoo/models/account.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static const String _databaseName = "flyoo.db";
  static const int _databaseVersion = 1;

  static const String tableAccount = "Account";
  static const String tableAttendance = "Attendance";

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  Database? _database;
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database!;

    _database = await _initializeDatabase();
    return _database;
  }

  Future<int> deleteAccount(int accountId) async {
    Database? db = await database;
    return await db!.delete(
      tableAccount,
      where: "id = ?",
      whereArgs: [accountId],
    );
  }

  Future<int> insertAccount(Account account) async {
    Database? db = await database;

    Map<String, dynamic> accountMap = {
      'accountAlias': account.accountAlias,
      'accountName': account.accountName,
      'accountPass': account.accountPass,
    };

    return await db!.insert(tableAccount, accountMap);
  }

  Future<List<Account>> queryAccounts() async {
    Database? db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(tableAccount);

    return List.generate(maps.length, (i) {
      return Account(
        id: maps[i]['id'],
        accountAlias: maps[i]['accountAlias'],
        accountName: maps[i]['accountName'],
        accountPass: maps[i]['accountPass'],
      );
    });
  }

  Future<Database> _initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final fullPath = "$databasePath/$_databaseName";

    return await openDatabase(
      fullPath,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database database, int version) async {
    await database.execute('''
    CREATE TABLE $tableAccount (
      id INTEGER PRIMARY KEY,
      accountAlias TEXT,
      accountName TEXT,
      accountPass TEXT
    );
    ''');

    await database.execute('''
    CREATE TABLE $tableAttendance (
      id INTEGER PRIMARY KEY,
      accountId INTEGER,
      clockInTime TEXT,
      clockOutTime TEXT,
      FOREIGN KEY(accountId) REFERENCES Account(id)
    );
    ''');
  }
}
