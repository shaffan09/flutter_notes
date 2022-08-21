import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // static method to get database instance
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(
      join(dbPath, 'flutter_notes.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes(id TEXT PRIMARY KEY, title TEXT NOT NULL, body TEXT NOT NULL, dateTime TEXT NOT NULL)',
        );
      },
      version: 1,
    );
  }

  // static method to insert data into table
  static Future<void> insert(String table, Map<String, Object> values) async {
    final db = await DBHelper.database();

    db.insert(
      table,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, Object?>>> getData(String table) async {
    final db = await DBHelper.database();

    return db.query(table);
  }

  static Future<void> delete(String id) async {
    final db = await DBHelper.database();

    db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> update(String id, Map<String, Object?> values) async {
    final db = await DBHelper.database();

    db.update(
      'notes',
      values,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
