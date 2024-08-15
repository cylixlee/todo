import 'package:flutter/material.dart';
import 'package:todo/components/todo_list.dart';

class HomePage extends StatelessWidget {
  final items = const <TodoItem>[
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
    ("Lorem ipsum", "some detailed information"),
  ];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("To Do"),
        centerTitle: true,
      ),
      body: TodoList(items: items),
    );
  }
}
