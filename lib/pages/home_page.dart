import 'package:flutter/material.dart';
import 'package:todo/components/todo_list.dart';
import 'package:todo/dialog/message_box.dart';
import 'package:todo/dialog/task_creator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = <TodoItem>[
    TodoItem(
      title: "Lorem ipsum",
      description: "some detailed information",
      done: false,
    ),
  ];

  void createTask() {
    final title = TextEditingController();
    final description = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return TaskCreatorDialog(
          title: "Create task",
          onConfirm: () {
            if (title.text.isEmpty || description.text.isEmpty) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => const MessageBox(
                  title: "Oops...empty task?",
                  description: "Please type in task title & description.",
                ),
              );
              return;
            }
            setState(() {
              items.add(TodoItem(
                title: title.text,
                description: description.text,
                done: false,
              ));
            });
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
          titleController: title,
          descriptionController: description,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void editTask(int index) {
    final title = TextEditingController(text: items[index].title);
    final description = TextEditingController(text: items[index].description);
    showDialog(
      context: context,
      builder: (context) {
        return TaskCreatorDialog(
          title: "Edit task",
          onConfirm: () {
            if (title.text.isEmpty || description.text.isEmpty) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => const MessageBox(
                  title: "Oops...empty task?",
                  description: "Please type in task title & description.",
                ),
              );
              return;
            }
            setState(() {
              items[index].title = title.text;
              items[index].description = description.text;
            });
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
          titleController: title,
          descriptionController: description,
        );
      },
    );
  }

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
      body: TodoList(
        items: items,
        onTileDeleted: deleteTask,
        onTileTapped: editTask,
      ),
    );
  }
}
