import 'package:flutter/material.dart';
import 'package:todo/components/dialog/message_box.dart';
import 'package:todo/components/dialog/task_dialog.dart';
import 'package:todo/components/todo_list.dart';
import 'package:todo/data/todo_database.dart';
import 'package:todo/data/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

typedef TaskDialogCallback = void Function(
  TextEditingController,
  TextEditingController,
);

void _showTaskDialog(
  BuildContext context,
  String title,
  TaskDialogCallback action,
) {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => TaskDialog(
      title: title,
      onConfirm: () {
        if (titleController.text.isEmpty ||
            descriptionController.text.isEmpty) {
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
        action(titleController, descriptionController);
        Navigator.pop(context);
      },
      onCancel: () => Navigator.pop(context),
      titleController: titleController,
      descriptionController: descriptionController,
    ),
  );
}

class _HomePageState extends State<HomePage> {
  final TodoDatabase _database = TodoDatabase();

  @override
  void initState() {
    super.initState();
    _database.load();
  }

  void createTask() {
    _showTaskDialog(context, "Create task", (title, description) {
      setState(() {
        _database.write((items) {
          items.add(TodoItem(
            title: title.text,
            description: description.text,
            done: false,
          ));
        });
      });
    });
  }

  void deleteTask(int index) {
    setState(() {
      _database.write((items) {
        items.removeAt(index);
      });
    });
  }

  void editTask(int index) {
    _showTaskDialog(context, "Edit task", (title, description) {
      setState(() {
        _database.write((items) {
          items[index]
            ..title = title.text
            ..description = description.text;
        });
      });
    });
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
        items: _database.read((items) => items),
        onCheckboxChanged: (index, value) {
          setState(() {
            _database.write((items) {
              items[index].done = value!;
            });
          });
        },
        onTileDeleted: deleteTask,
        onTileTapped: editTask,
      ),
    );
  }
}
