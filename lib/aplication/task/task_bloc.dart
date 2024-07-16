import 'package:bloc/bloc.dart';
import 'package:lista_tareas_bloc/domain/models/task_model.dart';
import 'package:lista_tareas_bloc/repository/repository_task.dart';
import 'task_event.dart';
import 'task_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc que maneja la lógica de negocio relacionada con las tareas.
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskLoading()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    try {
      final tasks = await taskRepository.fetchTasks();
      emit(TaskLoaded(tasks));
    } catch (_) {
      emit(TaskError());
    }
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    if (state is TaskLoaded) {
      final List<Task> updatedTasks = List.from((state as TaskLoaded).tasks)
        ..add(event.task);
      emit(TaskLoaded(updatedTasks));
      taskRepository.addTask(event.task);
    }
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    if (state is TaskLoaded) {
      final List<Task> updatedTasks = (state as TaskLoaded).tasks.map((task) {
        return task.id == event.task.id ? event.task : task;
      }).toList();
      emit(TaskLoaded(updatedTasks));
      taskRepository.updateTask(event.task);
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    if (state is TaskLoaded) {
      final updatedTasks = (state as TaskLoaded)
          .tasks
          .where((task) => task.id != event.task.id)
          .toList();
      emit(TaskLoaded(updatedTasks));
      taskRepository.deleteTask(event.task);
    }
  }
}
