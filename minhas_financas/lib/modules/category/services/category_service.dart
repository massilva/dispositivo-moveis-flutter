import '../datasources/category_datasource.dart';
import '../models/category_model.dart';

class CategoryService {
  final CategoryDatasource _categoryDatasource;

  CategoryService({required CategoryDatasource categoryDatasource})
      : _categoryDatasource = categoryDatasource;

  Future<List<Category>> getCategories() async {
    return await _categoryDatasource.getAll();
  }

  String? save(Category category) {
    try {
      _categoryDatasource.insert(category);
      return null;
    } catch (error) {
      return error.toString();
    }
  }

  void remove(int index) {
    _categoryDatasource.deleteById(index);
  }

  void updateCategory(int index, Category updatedCategory) {
    final copy = updatedCategory.copyWith(id: index);
    _categoryDatasource.update(copy);
  }
}
