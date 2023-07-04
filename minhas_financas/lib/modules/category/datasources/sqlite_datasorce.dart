import 'package:sqlite3/sqlite3.dart';

import '../models/category_model.dart';
import 'category_datasource.dart';

class SqliteDatasource implements CategoryDatasource {
  static const String _kDatabaseName = 'categories.db';
  static const String _kTableName = 'categories';
  static const String _kIdColumn = 'id';
  static const String _kNameColumn = 'name';
  static const String _kDescriptionColumn = 'description';
  static const String _kColorColumn = 'color';

  Database _openDatabase() {
    const path = 'minhas_financas/$_kDatabaseName';
    final db = sqlite3.open(path);
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
    final db = _openDatabase();
    db.execute(
      'INSERT INTO $_kTableName ($_kIdColumn, $_kNameColumn) VALUES (?, ?)',
      [category.id, category.name],
    );
    db.dispose();
  }

  @override
  Future<void> update(Category category) async {
    final db = _openDatabase();
    db.execute(
      'UPDATE $_kTableName SET $_kNameColumn = ?, $_kColorColumn = ?, $_kDescriptionColumn = ? WHERE $_kIdColumn = ?',
      [category.name, category.color, category.description, category.id],
    );
    db.dispose();
  }

  @override
  Future<void> delete(Category category) async {
    final db = _openDatabase();
    db.execute(
      'DELETE FROM $_kTableName WHERE $_kIdColumn = ?',
      [category.id],
    );
    db.dispose();
  }

  @override
  Future<List<Category>> getAll() async {
    final db = _openDatabase();
    final List<Map<String, dynamic>> result = db.select(
      'SELECT $_kIdColumn, $_kNameColumn, $_kColorColumn, $_kDescriptionColumn FROM $_kTableName',
    );
    db.dispose();
    return result.map(Category.fromMap).toList();
  }

  @override
  Future<void> deleteById(int id) async {
    final db = _openDatabase();
    db.execute(
      'DELETE FROM $_kTableName WHERE $_kIdColumn = ?',
      [id],
    );
    db.dispose();
  }
}
