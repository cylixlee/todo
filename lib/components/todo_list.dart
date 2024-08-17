import 'package:flutter/material.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/data/todo_item.dart';

typedef TileCheckboxChangedCallback = void Function(int, bool?);
typedef TileTapCallback = void Function(int);
typedef TileDeleteCallback = void Function(int);

class TodoList extends StatefulWidget {
  final List<TodoItem> items;
  final double padding;
  final double spacing;
  final TileCheckboxChangedCallback? onCheckboxChanged;
  final TileTapCallback? onTileTapped;
  final TileDeleteCallback? onTileDeleted;

  final double? tilePadding;
  final double? tileCheckboxSpacing;
  final double? tileBorderRadius;
  final double? tileTitleFontSize;
  final double? tileDescriptionFontSize;

  const TodoList({
    super.key,
    required this.items,
    this.onCheckboxChanged,
    this.onTileTapped,
    this.onTileDeleted,
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
    if (widget.items.isEmpty) {
      return const Center(
        child: Text("Nothing to do."),
      );
    }

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
          onCheckboxChanged: (value) {
            if (widget.onCheckboxChanged != null) {
              widget.onCheckboxChanged!(index, value);
            }
          },
          onTap: () {
            if (widget.onTileTapped != null) {
              widget.onTileTapped!(index);
            }
          },
          onDeleted: (_) {
            if (widget.onTileDeleted != null) {
              widget.onTileDeleted!(index);
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
