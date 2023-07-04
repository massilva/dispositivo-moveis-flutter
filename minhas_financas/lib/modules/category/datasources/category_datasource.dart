import '../models/category_model.dart';

abstract class CategoryDatasource {
  Future<void> insert(Category category);
  Future<void> update(Category category);
  Future<void> delete(Category category);
  Future<void> deleteById(int id);
  Future<List<Category>> getAll();
}
