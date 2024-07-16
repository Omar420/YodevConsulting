import 'package:lista_tareas_bloc/domain/models/task_model.dart';
import 'package:equatable/equatable.dart';

// Clase base para todos los estados relacionados con las tareas.
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

// Estado cuando las tareas están siendo cargadas.
class TaskLoading extends TaskState {}

// Estado cuando las tareas han sido cargadas exitosamente.
class TaskLoaded extends TaskState {
  final List<Task> tasks;

  const TaskLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}

// Estado cuando ocurre un error al cargar las tareas.
class TaskError extends TaskState {}
