import 'package:flutter/material.dart';
import 'package:memories/model/gift.dart';
import 'package:memories/model/quiz_question.dart';
import 'package:memories/pages/gift/gift.dart';
import 'package:memories/pages/prize/prize.dart';
import 'package:memories/services/level_service.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  final QuizQuestion question;

  const QuestionPage({super.key, required this.question});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final TextEditingController answerController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _answerValidationError;

  void _navigateToPrize(int level) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PrizePage(
          level: level,
        ),
      ),
    );
  }

  void _navigateToGift(Gift gift) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => GiftPage(
          gift: gift,
        ),
      ),
    );
  }

  String? _validateAnswer(String? answer) {
    if (answer == null || answer.isEmpty) {
      return 'Please provide an answer.';
    }
    if (answer.toLowerCase().trim() !=
        widget.question.correctAnswer.toLowerCase().trim()) {
      return "The answer '$answer' is not correct.";
    }

    return null;
  }

  Future<void> _setCurrentLevel() {
    int newLevel = widget.question.level + 1;
    return Provider.of<LevelService>(context, listen: false).setLevel(newLevel);
  }

  void _onSubmitAnswer(String answer) {
    setState(() {
      _answerValidationError = _validateAnswer(answer);
    });

    if (_formKey.currentState!.validate() && _answerValidationError == null) {
      _setCurrentLevel().then((_) {
        Gift? gift = widget.question.gift;
        if (gift != null) {
          _navigateToGift(gift);
        } else {
          _navigateToPrize(widget.question.level);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Level: ${widget.question.level}"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                widget.question.question,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                controller: answerController,
                validator: _validateAnswer,
                decoration: const InputDecoration(
                  labelText: 'Answer',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final answer = answerController.text;
                _onSubmitAnswer(answer);
              },
              child: const Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }
}
