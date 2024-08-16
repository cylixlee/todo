import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final String title;
  final String description;

  const MessageBox({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.warning),
      title: Text(title),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        )
      ],
      content: Text(description),
    );
  }
}
