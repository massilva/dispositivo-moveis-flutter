import '../models/category_model.dart';

class CategoryService {
  final List<Category> _database;

  CategoryService()
      : _database = [
          // Category(name: 'Imposto', color: 0xFFF45757),
          // Category(name: 'Entrada', color: 0xFF5cc6ba),
          // Category(name: 'Pagamento', color: 0xFF6680EC),
        ];

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
}
