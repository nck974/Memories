import 'package:flutter/material.dart';
import 'package:photo_quiz/pages/home/components/level_box.dart';
import 'package:photo_quiz/pages/question/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = "Photo Quiz";
  final int rowCount = 3; // Change this to the number of rows you want.
  final int columnCount = 3; // Change this to the number of columns you want.

  void _navigateToQuestion(int level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionPage(
          question: "When did something happen on x day of y year?",
          correctAnswer: "t",
          level: level,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          9,
          (index) => GestureDetector(
            onTap: () {
              // Handle the click event for the grid element here.
              print('Clicked on element $index');
              _navigateToQuestion(index);
            },
            child: LevelBox(index: index),
          ),
        ),
      ),
    );
  }
}
