import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  static const TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );
  static const TextStyle titleDoneStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    decoration: TextDecoration.lineThrough,
  );
  static const TextStyle descriptionStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );
  static const TextStyle descriptionDoneStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
    decoration: TextDecoration.lineThrough,
  );

  final double borderRadius;
  final double padding;
  final double checkboxSpacing;

  final String title;
  final String description;

  const TodoTile({
    super.key,
    required this.title,
    required this.description,
    this.borderRadius = 8.0,
    this.padding = 12.0,
    this.checkboxSpacing = 10.0,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool done = false;

  void onCheckboxChanged(bool? value) {
    setState(() {
      done = !done;
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
            padding: EdgeInsets.only(right: widget.checkboxSpacing),
            child: Checkbox(
              value: done,
              onChanged: onCheckboxChanged,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: done ? TodoTile.titleDoneStyle : TodoTile.titleStyle,
                ),
                Text(
                  widget.description,
                  style: done
                      ? TodoTile.descriptionDoneStyle
                      : TodoTile.descriptionStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
