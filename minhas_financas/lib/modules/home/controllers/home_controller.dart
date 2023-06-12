import '../../task/services/task_service.dart';

class HomeController {
  //
  // Classe responsável pelo interação dos dados e a página
  //
  final TaskService _taskService;

  HomeController({required TaskService taskService})
      : _taskService = taskService;

  getTasks() {
    return _taskService.getTasks();
  }
}
