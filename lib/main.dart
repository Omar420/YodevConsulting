import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_tareas_bloc/aplication/task/task_bloc.dart';
import 'package:lista_tareas_bloc/aplication/task/task_event.dart';
import 'package:lista_tareas_bloc/presentation/screens/home.dart';

import 'repository/repository_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TaskRepository taskRepository = TaskRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TaskBloc(taskRepository)..add(LoadTasks()),
        child: HomeView(),
      ),
    );
  }
}
