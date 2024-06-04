import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

///
class DatabaseService {
  const DatabaseService({
    required this.helper,
  });

  final DatabaseHelper helper;

  Future<bool> insert({
    required String tableName,
    required Map<String, Object?> entity,
  }) async {
    try {
      final db = await helper.db;

      await db.insert(
        tableName,
        entity,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update({
    required String tableName,
    required Map<String, Object?> entity,
    required String whereParams,
    required List<Object?> whereValues,
  }) async {
    try {
      final db = await helper.db;

      final hasModel = await exists(
        tableName: tableName,
        whereParams: whereParams,
        whereValues: whereValues,
      );

      if (hasModel) {
        await db.update(
          tableName,
          entity,
          where: whereParams,
          whereArgs: whereValues,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete({
    required String tableName,
    required String whereParams,
    required List<Object?> whereValues,
  }) async {
    try {
      final db = await helper.db;

      final remove = await exists(
        tableName: tableName,
        whereParams: whereParams,
        whereValues: whereValues,
      );
      if (remove) {
        await db.delete(
          tableName,
          where: whereParams,
          whereArgs: whereValues,
        );
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>?> find({
    required String tableName,
    required String whereParams,
    required List<Object?> whereValues,
  }) async {
    try {
      final db = await helper.db;

      final exist = await exists(
        tableName: tableName,
        whereParams: whereParams,
        whereValues: whereValues,
      );

      if (exist) {
        final result = await db.query(
          tableName,
          limit: 1,
          where: whereParams,
          whereArgs: whereValues,
        );
        if (result.isNotEmpty) {
          return Future.value(result[0]);
        }
      }

      return null;

    } catch (e) {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> list({
    required String tableName,
  }) async {
    try {
      final db = await helper.db;
      final data = await db.query(
        tableName,
        
      );
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> exists({
    required String tableName,
    required String whereParams,
    required List<Object?> whereValues,
  }) async {
    try {
      final db = await helper.db;
      final list = await db.rawQuery(
        'select count(*) as total from $tableName WHERE $whereParams',
        whereValues,
      );
      final count = list.isNotEmpty ? list[0]['total'] ?? 0 : 0;

      if (count as int > 0) {
        return Future.value(count > 0);
      }

      return false;
    } catch (e) {
      return false;
    }
  }

}
