import 'package:flutter/material.dart';
import 'package:photo_quiz/model/quiz_question.dart';
import 'package:photo_quiz/pages/home/components/level_box.dart';
import 'package:photo_quiz/pages/home/question_service.dart';
import 'package:photo_quiz/pages/question/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = "Photo Quiz";
  final int columnCount = 2;
  int currentLevel = 1;
  List<QuizQuestion> questions = [];

  void _navigateToQuestion(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionPage(
          question: questions[index],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadQuestions().then((questions) {
      setState(() {
        this.questions = questions;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: columnCount,
              children: List.generate(
                questions.length,
                (index) {
                  int level = questions[index].level;
                  bool levelEnabled = level <= currentLevel;
                  return GestureDetector(
                    onTap: () {
                      if (levelEnabled) {
                        return;
                      }
                      _navigateToQuestion(index);
                    },
                    child: LevelBox(index: level, disabled: !levelEnabled),
                  );
                },
              ),
            ),
    );
  }
}
