import 'package:equatable/equatable.dart';
import 'package:lista_tareas_bloc/domain/models/task_model.dart';

// Clase base para todos los eventos relacionados con las tareas.
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

// Evento para cargar las tareas.
class LoadTasks extends TaskEvent {}

// Evento para agregar una nueva tarea.
class AddTask extends TaskEvent {
  final Task task;

  const AddTask(this.task);

  @override
  List<Object> get props => [task];
}

// Evento para actualizar una tarea existente.
class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask(this.task);

  @override
  List<Object> get props => [task];
}

// Evento para eliminar una tarea.
class DeleteTask extends TaskEvent {
  final Task task;

  const DeleteTask(this.task);

  @override
  List<Object> get props => [task];
}
