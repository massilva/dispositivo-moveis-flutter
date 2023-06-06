import '../models/task_model.dart';
import 'category_service.dart';

class TaskService {
  final CategoryService _categoryService;

  TaskService({required CategoryService categoryService})
      : _categoryService = categoryService;

  ///
  /// Classe responsável por interagir com a fonte dos dados
  ///
  List<Task> getTasks() {
    return List.generate(
      4,
      (index) {
        final categories = _categoryService.getCategories();
        return Task(
          title: 'Texto $index',
          description: 'Falta ${index * 2} dias',
          category: categories[index % categories.length],
          finished: index.isEven,
        );
      },
    );
  }
}
