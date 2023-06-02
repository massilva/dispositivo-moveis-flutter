import 'package:flutter/material.dart';

import '../../controllers/home_controller.dart';
import '../../services/task_service.dart';

class ListTasks extends StatefulWidget {
  const ListTasks({super.key});

  @override
  State<ListTasks> createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  // Instância de controller
  final controller = HomeController(
    taskService: TaskService(),
  );
  List tasks;

  _ListTasksState() : tasks = [];

  @override
  void initState() {
    // Pega a lista de tarefas
    tasks = controller.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return Text(tasks[index]);
      },
      itemCount: tasks.length,
    );
  }
}
