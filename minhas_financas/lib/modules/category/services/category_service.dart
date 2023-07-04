import '../models/category_model.dart';

class CategoryService {
  static final CategoryService _instance = CategoryService._internal();

  factory CategoryService() {
    return _instance;
  }

  CategoryService._internal();

  final _database = <Category>[];
  List<Category> getCategories() {
    return _database;
  }

  String? save(Category category) {
    try {
      _database.add(category);
      return null;
    } catch (error) {
      return error.toString();
    }
  }

  void remove(int index) {
    _database.removeAt(index);
  }

  void updateCategory(int index, Category updatedCategory) {
    _database[index] = updatedCategory;
  }
}
