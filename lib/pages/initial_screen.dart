import 'package:flutter/material.dart';
import 'package:projeto_alura/Components/task.dart';
import 'package:projeto_alura/data/task_dao.dart';

import 'package:projeto_alura/pages/forms_screen.dart';

import '../data/task_inherited.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );

              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );

              case ConnectionState.active:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );

              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final Task tarefa = items[index];
                        return tarefa;
                      },
                    );
                  }
                  return Center(
                    child: Column(children: const [
                      Icon(
                        Icons.error_outline,
                        size: 128,
                      ),
                      Text('')
                    ]),
                  );
                }
                const Text('Erro ao carregar tarefas');
                break;
            }
            return const Text('Erro desconhecido');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(
                  taskContext: context,
                ),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
