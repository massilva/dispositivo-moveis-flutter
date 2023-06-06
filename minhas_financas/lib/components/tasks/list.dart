import 'package:flutter/material.dart';
import '../subtitle_widget.dart';
import '../title_widget.dart';
import '../../models/task_model.dart';
import '../../services/category_service.dart';
import '../../shared/styles.dart';

import '../../controllers/home_controller.dart';
import '../../services/task_service.dart';
import '../../shared/constants.dart';

class ListTasks extends StatefulWidget {
  const ListTasks({super.key});

  @override
  State<ListTasks> createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  // Instância de controller
  final controller = HomeController(
    taskService: TaskService(
      categoryService: CategoryService(),
    ),
  );
  List<Task> tasks;

  _ListTasksState() : tasks = [];

  @override
  void initState() {
    // Pega a lista de tarefas
    tasks = controller.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleDefault(title: AppConstants.nextTasks),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (_, index) {
              return Row(
                children: [
                  // Circulo
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(tasks[index].category.color),
                    ),
                  ),
                  //Texto com título e subtitulo
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleDefault(title: tasks[index].title),
                          SubtitleDefault(title: tasks[index].description),
                        ],
                      ),
                    ),
                  ),
                  //Checkbox
                  Checkbox(
                    side: const BorderSide(
                      color: AppStyle.primaryColor,
                      width: 2,
                    ),
                    activeColor: AppStyle.primaryColor,
                    value: tasks[index].finished,
                    onChanged: (value) {
                      setState(() {
                        tasks[index] = tasks[index].copyWith(finished: value);
                      });
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
