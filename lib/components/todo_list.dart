import 'package:flutter/material.dart';
import 'package:todo/components/todo_tile.dart';

class TodoItem {
  String title;
  String description;
  bool done;

  TodoItem({
    required this.title,
    required this.description,
    required this.done,
  });
}

typedef TileTapCallback = void Function(int);

class TodoList extends StatefulWidget {
  final List<TodoItem> items;
  final double padding;
  final double spacing;
  final TileTapCallback? onTileTapped;

  final double? tilePadding;
  final double? tileCheckboxSpacing;
  final double? tileBorderRadius;
  final double? tileTitleFontSize;
  final double? tileDescriptionFontSize;

  const TodoList({
    super.key,
    required this.items,
    this.onTileTapped,
    double? padding,
    double? spacing,
    this.tilePadding,
    this.tileCheckboxSpacing,
    this.tileBorderRadius,
    this.tileTitleFontSize,
    this.tileDescriptionFontSize,
  })  : padding = padding ?? 20.0,
        spacing = spacing ?? 10.0;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(widget.padding),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final tile = TodoTile(
          title: widget.items[index].title,
          description: widget.items[index].description,
          done: widget.items[index].done,
          padding: widget.tilePadding,
          checkboxSpacing: widget.tileCheckboxSpacing,
          borderRadius: widget.tileBorderRadius,
          titleFontSize: widget.tileTitleFontSize,
          descriptionFontSize: widget.tileDescriptionFontSize,
          onCheckboxChanged: (value) => setState(() {
            widget.items[index].done = value!;
          }),
          onTap: () {
            if (widget.onTileTapped != null) {
              widget.onTileTapped!(index);
            }
          },
        );

        if (index == 0) {
          return tile;
        }
        return Padding(
          padding: EdgeInsets.only(top: widget.spacing),
          child: tile,
        );
      },
    );
  }
}
