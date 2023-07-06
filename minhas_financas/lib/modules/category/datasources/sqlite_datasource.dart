import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart' as path;

import '../models/category_model.dart';
import 'category_datasource.dart';

class SqliteDatasource implements CategoryDatasource {
  static const String _kDatabaseName = 'categories.db';
  static const String _kTableName = 'categories';
  static const String _kIdColumn = 'id';
  static const String _kNameColumn = 'name';
  static const String _kDescriptionColumn = 'description';
  static const String _kColorColumn = 'color';

  Future<sqflite.Database> _openDatabase() async {
    final dbPath = await sqflite.getDatabasesPath();
    final pathToDatabase = path.join(dbPath, _kDatabaseName);
    final db = await sqflite.openDatabase(pathToDatabase);
    db.execute('''
      CREATE TABLE IF NOT EXISTS $_kTableName (
        $_kIdColumn INTEGER PRIMARY KEY,
        $_kNameColumn TEXT,
        $_kColorColumn INTEGER,
        $_kDescriptionColumn TEXT
      )
    ''');
    return db;
  }

  @override
  Future<void> insert(Category category) async {
    final db = await _openDatabase();
    db.insert(
      _kTableName,
      {
        _kIdColumn: category.id,
        _kNameColumn: category.name,
      },
    );
    await db.close();
  }

  @override
  Future<void> update(Category category) async {
    final db = await _openDatabase();
    db.update(
      _kTableName,
      {
        _kNameColumn: category.name,
        _kColorColumn: category.color,
        _kDescriptionColumn: category.description,
      },
      where: '$_kIdColumn = ?',
      whereArgs: [category.id],
    );
    await db.close();
  }

  @override
  Future<void> delete(Category category) async {
    final db = await _openDatabase();
    db.delete(
      _kTableName,
      where: '$_kIdColumn = ?',
      whereArgs: [category.id],
    );
    await db.close();
  }

  @override
  Future<List<Category>> getAll() async {
    final db = await _openDatabase();
    final List<Map<String, dynamic>> result = await db.query(_kTableName);
    await db.close();
    return result.map(Category.fromMap).toList();
  }

  @override
  Future<void> deleteById(int id) async {
    final db = await _openDatabase();
    db.delete(
      _kTableName,
      where: '$_kIdColumn = ?',
      whereArgs: [id],
    );
    await db.close();
  }
}
