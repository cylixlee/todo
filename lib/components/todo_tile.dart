import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  static const TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );
  static const TextStyle descriptionStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );

  final String title;
  final String description;

  final double borderRadius;
  final double padding;

  const TodoTile({
    super.key,
    required this.title,
    required this.description,
    this.borderRadius = 8.0,
    this.padding = 12.0,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool completed = false;

  void onCheckboxChanged(bool? value) {
    setState(() {
      completed = !completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      padding: EdgeInsets.all(widget.padding),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: widget.padding / 2),
            child: Checkbox(
              value: completed,
              onChanged: onCheckboxChanged,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: TodoTile.titleStyle),
              Text(widget.description, style: TodoTile.descriptionStyle),
            ],
          )
        ],
      ),
    );
  }
}
