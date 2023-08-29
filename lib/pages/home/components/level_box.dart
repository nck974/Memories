import 'package:flutter/material.dart';

class LevelBox extends StatelessWidget {
  final int index;
  const LevelBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Element $index',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
