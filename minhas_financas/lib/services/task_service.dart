import '../models/category_model.dart';
import '../models/task_model.dart';

class TaskService {
  ///
  /// Classe responsável por interagir com a fonte dos dados
  ///
  List<Task> getTasks() {
    return List.generate(
      4,
      (index) {
        final categories = [
          Category(name: 'Imposto', color: 0xFFF45757),
          Category(name: 'Entrada', color: 0xFF5cc6ba),
          Category(name: 'Pagamento', color: 0xFF6680EC),
        ];
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
