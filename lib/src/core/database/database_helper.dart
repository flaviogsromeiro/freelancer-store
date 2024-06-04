import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'database_schema.dart';

class DatabaseHelper {
  
  factory DatabaseHelper() => _instance;

  DatabaseHelper.getInstance();
  static final DatabaseHelper _instance = DatabaseHelper.getInstance();

  static Database? _db;
  late String _dbName;

  Future<Database> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<void> openDB({
    required String dbName,
    required int companyId,
  }) async {
    if (_db != null) {
      if (_db!.isOpen) {
        await _db!.close();
      }
      _db = null;
    }
    _dbName = dbName;

    _db = await _open(
      dbName: _dbName,
      onCreate: _onCreate,
    );
  }

  Future<Database> _open({
    required String dbName,
    required FutureOr<void> Function(
      Database db,
      int version,
    ) onCreate,
  }) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, dbName);

    return openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
  }

  Future<Database> _initDb() async {
    final db = await _open(
      dbName: _dbName,
      onCreate: _onCreate,
    );
    return db;
  }

  FutureOr<void> _onCreate(
    Database db,
    int newVersion,
  ) async {
    for (final script in DatabaseSchema.table) {
      if (script.trim().isNotEmpty) {
        await db.execute(script);
      }
    }

    final batch = db.batch();

    await batch.commit(
      continueOnError: true,
      noResult: true,
    );
  }

  Future<void> close() async {
    final dbClient = await db;
    return dbClient.close();
  }
}
