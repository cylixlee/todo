import 'package:flutter/material.dart';
import 'package:todo/components/todo_list.dart';

class HomePage extends StatelessWidget {
  final items = const <TodoItem>[
    ("Lorem ipsum", "some detailed information"),
  ];

  const HomePage({super.key});

  void createTask() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("To Do"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: createTask,
        icon: const Icon(Icons.add),
        label: const Text("Add task"),
        shape: const StadiumBorder(),
      ),
      body: TodoList(items: items),
    );
  }
}
