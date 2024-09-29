import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('teachers.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    String path = join(await getDatabasesPath(), fileName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE teachers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        subject TEXT,
        phoneNumber TEXT,
        whatsappNumber TEXT
      )
    ''');
  }

  Future<void> insertTeacher(Map<String, dynamic> teacher) async {
    final db = await database;
    await db.insert('teachers', teacher);
  }

  Future<List<Map<String, dynamic>>> getTeachers() async {
    final db = await database;
    return await db.query('teachers');
  }
}
