import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:photo_quiz/model/quiz_question.dart';

Future<List<QuizQuestion>> loadQuestions() async {
  print("Loading questions...");
  // Load the JSON file from assets
  final String jsonString =
      await rootBundle.loadString('assets/questions.json');

  // Parse the JSON data as a list of maps
  final List<dynamic> data = json.decode(jsonString);

  // Convert each map to a QuizQuestion object
  final List<QuizQuestion> questions = data.map((question) {
    return QuizQuestion.fromJson(question);
  }).toList();

  return questions;
}
