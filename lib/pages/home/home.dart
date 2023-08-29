import 'package:flutter/material.dart';
import 'package:photo_quiz/model/quiz_question.dart';
import 'package:photo_quiz/pages/home/components/level_box.dart';
import 'package:photo_quiz/pages/home/question_service.dart';
import 'package:photo_quiz/pages/prize/prize.dart';
import 'package:photo_quiz/pages/question/question.dart';
import 'package:photo_quiz/services/level_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = "Photo Quiz";
  final int columnCount = 2;
  int currentLevel = 0;
  List<QuizQuestion> questions = [];

  void _navigateToQuestion(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionPage(
          question: questions[index],
        ),
      ),
    ).then(
      (value) => _setCurrentLevel(),
    );
  }

  void _navigateToPrize(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrizePage(
          level: questions[index].level,
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
    Future.delayed(const Duration(milliseconds: 100), _setCurrentLevel);
  }

  void _setCurrentLevel() {
    int? currentLevel =
        Provider.of<LevelService>(context, listen: false).getLevel();
    print("Current level is $currentLevel");
    setState(() {
      if (currentLevel == null) {
        this.currentLevel = 1;
        Provider.of<LevelService>(context, listen: false)
            .setLevel(this.currentLevel);
      } else {
        this.currentLevel = currentLevel;
      }
    });
  }

  void _onTapLevel(int index, int level) {
    if (level > currentLevel) {
      return;
    }
    if (level < currentLevel) {
      _navigateToPrize(index);
      return;
    }
    _navigateToQuestion(index);
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
                  return GestureDetector(
                    onTap: () => _onTapLevel(index, level),
                    child: LevelBox(
                        index: level,
                        completed: level < currentLevel,
                        disabled: level > currentLevel,
                        selected: level == currentLevel),
                  );
                },
              ),
            ),
    );
  }
}
