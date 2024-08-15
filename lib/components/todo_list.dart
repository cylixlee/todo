import 'package:flutter/material.dart';
import 'package:todo/components/todo_tile.dart';

typedef TodoItem = (String, String);

class TodoList extends StatelessWidget {
  final List<TodoItem> items;
  final double paddingAround;
  final double paddingBetween;
  final double tileBorderRadius;
  final double tilePadding;

  const TodoList({
    super.key,
    required this.items,
    this.paddingAround = 20.0,
    this.paddingBetween = 20.0,
    this.tileBorderRadius = 8.0,
    this.tilePadding = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(paddingAround),
      itemCount: items.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return TodoTile(
            title: items[index].$1,
            description: items[index].$2,
          );
        }
        return Padding(
          padding: EdgeInsets.only(top: paddingBetween),
          child: TodoTile(
            title: items[index].$1,
            description: items[index].$2,
            borderRadius: tileBorderRadius,
            padding: tilePadding,
          ),
        );
      },
    );
  }
}
