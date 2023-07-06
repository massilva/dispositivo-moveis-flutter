import '../../category/services/category_service.dart';
import '../models/task_model.dart';

class TaskService {
  final CategoryService _categoryService;

  TaskService({required CategoryService categoryService})
      : _categoryService = categoryService;

  ///
  /// Classe responsável por interagir com a fonte dos dados
  ///
  List<Task> getTasks() {
    return <Task>[];
  }
}
