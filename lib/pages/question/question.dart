import 'package:flutter/material.dart';
import 'package:photo_quiz/pages/prize/prize.dart';

class QuestionPage extends StatefulWidget {
  final String question;
  final int level;
  final String correctAnswer;

  const QuestionPage(
      {super.key,
      required this.question,
      required this.level,
      required this.correctAnswer});

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

  String? _validateAnswer(String? answer) {
    if (answer == null || answer.isEmpty) {
      return 'Please provide an answer.';
    }
    if (answer != widget.correctAnswer) {
      return "The answer '$answer' is not correct.";
    }

    return null;
  }

  void _onSubmitAnswer(String answer) {
    setState(() {
      _answerValidationError = _validateAnswer(answer);
    });

    if (_formKey.currentState!.validate() && _answerValidationError == null) {
      _navigateToPrize(widget.level);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Level: ${widget.level}"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.question,
              style: const TextStyle(fontSize: 18),
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