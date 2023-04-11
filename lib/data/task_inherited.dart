import 'package:flutter/material.dart';
import 'package:projeto_alura/Components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;
  final List<Task> taskList = [
    Task(
        nome: 'Aprender Flutter',
        foto: 'assets/images/dash.png',
        dificuldade: 2),
    Task(
        nome: 'Andar de Bike', foto: 'assets/images/bike.webp', dificuldade: 3),
    Task(nome: 'Meditar', foto: 'assets/images/meditar.jpeg', dificuldade: 4),
    Task(nome: 'Ler', foto: 'assets/images/livro.jpg', dificuldade: 5),
    Task(nome: 'Jogar', foto: 'assets/images/jogar.jpg', dificuldade: 1),
  ];
  void newTask(String name, String foto, int dificulty) {
    taskList.add(Task(nome: name, foto: foto, dificuldade: dificulty));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
