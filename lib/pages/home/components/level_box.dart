import 'package:flutter/material.dart';

class LevelBox extends StatelessWidget {
  final int index;
  final bool disabled;
  final bool selected;
  final bool completed;
  const LevelBox(
      {super.key,
      required this.index,
      required this.disabled,
      required this.selected,
      required this.completed});

  Color? _selectColor() {
    if (disabled) {
      return Colors.grey;
    }
    if (completed) {
      return Colors.lightGreen;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: selected ? Colors.orange : Colors.grey,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(30),
          color: _selectColor(),
        ),
        margin: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Level $index',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
