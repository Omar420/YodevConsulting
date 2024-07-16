import 'dart:async';
import 'package:lista_tareas_bloc/domain/models/task_model.dart';

/// Repositorio simulado para manejar la persistencia de tareas.
class TaskRepository {
  List<Task> tasks = [];

  /// Obtiene la lista de tareas.
  Future<List<Task>> fetchTasks() async {
    // Simula un retraso para imitar una operación asíncrona
    return Future.delayed(Duration(seconds: 1), () => tasks);
  }

  /// Agrega una nueva tarea a la lista.
  Future<void> addTask(Task task) async {
    tasks.add(task);
  }

  /// Actualiza una tarea existente.
  Future<void> updateTask(Task task) async {
    int index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task;
    }
  }

  /// Elimina una tarea de la lista.
  Future<void> deleteTask(Task task) async {
    tasks.removeWhere((t) => t.id == task.id);
  }
}
