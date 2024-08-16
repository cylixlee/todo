import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final String description;
  final bool done;

  final double padding;
  final double checkboxSpacing;
  final double borderRadius;
  final double titleFontSize;
  final double descriptionFontSize;
  final ValueChanged<bool?>? onCheckboxChanged;
  final GestureTapCallback? onTap;

  const TodoTile({
    super.key,
    required this.title,
    required this.description,
    required this.done,
    this.onCheckboxChanged,
    this.onTap,
    double? padding,
    double? checkboxSpacing,
    double? borderRadius,
    double? titleFontSize,
    double? descriptionFontSize,
  })  : padding = padding ?? 12.0,
        checkboxSpacing = checkboxSpacing ?? 10.0,
        borderRadius = borderRadius ?? 12.0,
        titleFontSize = titleFontSize ?? 16.0,
        descriptionFontSize = descriptionFontSize ?? 12.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: checkboxSpacing),
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
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFontSize,
                        decoration: done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: descriptionFontSize,
                        decoration: done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
