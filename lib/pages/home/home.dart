import 'package:flutter/material.dart';
import 'package:memories/model/gift.dart';
import 'package:memories/model/quiz_question.dart';
import 'package:memories/pages/gift/gift.dart';
import 'package:memories/pages/home/components/level_box.dart';
import 'package:memories/pages/home/components/terms_and_conditions.dart';
import 'package:memories/pages/home/services/question_service.dart';
import 'package:memories/pages/prize/prize.dart';
import 'package:memories/pages/question/question.dart';
import 'package:memories/services/level_service.dart';
import 'package:memories/services/terms_and_conditions_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = "Memories";
  final int columnCount = 3;
  int currentLevel = 0;
  List<QuizQuestion> questions = [];
  bool termsAccepted = false;

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

  void _navigateToGift(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GiftPage(
          gift: questions[index].gift!,
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
    Future.delayed(const Duration(milliseconds: 100), _setTermsAndConditions);
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

  void _setTermsAndConditions() {
    bool? termsAndConditions =
        Provider.of<TermsAndConditionsService>(context, listen: false)
            .getTermsAndConditions();
    print("Terms and conditions is $currentLevel");
    if (termsAndConditions != null) {
      setState(() {
        termsAccepted = termsAndConditions;
      });
    }
  }

  void _onTapLevel(int index, int level) {
    if (level > currentLevel) {
      return;
    }
    if (level < currentLevel) {
      Gift? gift = questions[index].gift;
      if (gift != null) {
        _navigateToGift(index);
      } else {
        _navigateToPrize(index);
      }
      return;
    }
    _navigateToQuestion(index);
  }

  Widget _buildQuestions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
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

  void _onAcceptConditions() {
    Provider.of<TermsAndConditionsService>(context, listen: false)
        .setTermsAndConditions(true)
        .then((value) => {
              setState(() {
                termsAccepted = true;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : termsAccepted
              ? _buildQuestions()
              : TermsAndConditions(onAcceptConditions: _onAcceptConditions),
    );
  }
}
