class QuizQuestion {
  final int level;
  final String question;
  final String correctAnswer;

  QuizQuestion({
    required this.level,
    required this.question,
    required this.correctAnswer,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      level: json['level'],
      question: json['question'],
      correctAnswer: json['correctAnswer'],
    );
  }
}
