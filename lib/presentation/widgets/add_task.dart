import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_tareas_bloc/aplication/task/task_bloc.dart';
import 'package:lista_tareas_bloc/aplication/task/task_event.dart';
import 'package:lista_tareas_bloc/domain/models/task_model.dart';

// Widget para agregar tareas
class AddTaskDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Task title'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            final String title = _controller.text;
            if (title.isNotEmpty) {
              final Task task =
                  Task(id: DateTime.now().millisecondsSinceEpoch, title: title);
              context.read<TaskBloc>().add(AddTask(task));
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
