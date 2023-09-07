import 'package:memories/model/gift.dart';

class QuizQuestion {
  final int level;
  final String question;
  final String correctAnswer;
  final Gift? gift;

  QuizQuestion(
      {required this.level,
      required this.question,
      required this.correctAnswer,
      this.gift});

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    Gift? gift;
    if (json["gift"] != null) {
      gift = Gift.fromJson(json["gift"]);
    }

    return QuizQuestion(
      level: json['level'],
      question: json['question'],
      correctAnswer: json['correctAnswer'],
      gift: gift,
    );
  }
}
