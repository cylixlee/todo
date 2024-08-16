import 'package:flutter/material.dart';
import 'package:todo/components/todo_tile.dart';

typedef TodoItem = (String, String);

class TodoList extends StatelessWidget {
  final List<TodoItem> items;
  final double padding;
  final double spacing;
  final double tileBorderRadius;
  final double tilePadding;
  final double tileCheckboxSpacing;

  const TodoList({
    super.key,
    required this.items,
    this.padding = 20.0,
    this.spacing = 20.0,
    this.tileBorderRadius = 8.0,
    this.tilePadding = 12.0,
    this.tileCheckboxSpacing = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(padding),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final tile = TodoTile(
          title: items[index].$1,
          description: items[index].$2,
          borderRadius: tileBorderRadius,
          padding: tilePadding,
          checkboxSpacing: tileCheckboxSpacing,
        );

        return index == 0
            ? tile
            : Padding(
                padding: EdgeInsets.only(top: spacing),
                child: tile,
              );
      },
    );
  }
}
