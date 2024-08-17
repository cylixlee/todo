import 'package:flutter/material.dart';

class TaskDialog extends StatelessWidget {
  final String title;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;

  const TaskDialog({
    super.key,
    required this.title,
    this.onConfirm,
    this.onCancel,
    this.titleController,
    this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.edit),
      title: Text(title),
      actions: [
        TextButton(onPressed: onConfirm, child: const Text("OK")),
        TextButton(onPressed: onCancel, child: const Text("Cancel")),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.title),
                  hintText: "title",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.description),
                  hintText: "description",
                ),
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
