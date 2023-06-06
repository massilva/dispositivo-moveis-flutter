import '../models/category_model.dart';

class CategoryService {
  List<Category> getCategories() {
    return [
      Category(name: 'Imposto', color: 0xFFF45757),
      Category(name: 'Entrada', color: 0xFF5cc6ba),
      Category(name: 'Pagamento', color: 0xFF6680EC),
    ];
  }
}
