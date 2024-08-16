import 'package:flutter/material.dart';
import 'package:todo/components/todo_list.dart';

class HomePage extends StatelessWidget {
  final items = <TodoItem>[
    TodoItem(
      title: "Lorem ipsum",
      description: "some detailed information",
      done: false,
    ),
  ];

  HomePage({super.key});

  void createTask() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("To Do"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
      body: TodoList(items: items),
    );
  }
}
