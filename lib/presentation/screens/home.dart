import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_tareas_bloc/aplication/task/task_bloc.dart';
import 'package:lista_tareas_bloc/aplication/task/task_event.dart';
import 'package:lista_tareas_bloc/aplication/task/task_state.dart';
import 'package:lista_tareas_bloc/presentation/widgets/add_task.dart';

// Página principal que muestra la lista de tareas.
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TaskLoaded) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  tileColor: task.isCompleted ? Colors.green : Colors.red,
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: Colors.black, // Color del texto negro
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.check),
                        onPressed: () {
                          context.read<TaskBloc>().add(
                                UpdateTask(task.copyWith(
                                  isCompleted: !task.isCompleted,
                                )),
                              );
                        },
                      ),
                      IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          context.read<TaskBloc>().add(DeleteTask(task));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Failed to load tasks'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return BlocProvider.value(
                value: context.read<TaskBloc>(),
                child: AddTaskDialog(),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
