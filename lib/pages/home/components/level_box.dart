import 'package:flutter/material.dart';

class LevelBox extends StatelessWidget {
  final int index;
  final bool disabled;
  const LevelBox({super.key, required this.index, required this.disabled});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(30),
          color: disabled ? Colors.grey : null,
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
