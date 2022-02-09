import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbConnection {
  String fileDbName;

  DbConnection({required this.fileDbName});

  static Database? _database;

  Future<Database> get getDatabase async {
    if (_database != null) {
      return await _database!;
    } else {
      _database = await _initDB();
      return await _database!;
    }
  }

  Future<Database> _initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), fileDbName),
      version: 1,
    );
  }

  closeDB() async {
    final db = await _database;
    await db!.close();
  }
}
