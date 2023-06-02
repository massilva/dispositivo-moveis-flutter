class TaskService {
  ///
  /// Classe responsável por interagir com a fonte dos dados
  ///
  List<String> getTasks() {
    return List.generate(1000, (index) => 'Texto $index');
  }
}
