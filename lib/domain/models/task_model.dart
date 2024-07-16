// Modelo de datos que representa una tarea.
class Task {
  final int id;
  final String title;
  bool isCompleted;

  Task({required this.id, required this.title, this.isCompleted = false});

  // Crea una copia de esta tarea con los campos modificados.
  Task copyWith({int? id, String? title, bool? isCompleted}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
