import 'package:quizzer/models/quiz.dart';

class QuizController {

  int _questionNumber = 0;

  final List<Quiz> _questionBank = [
    Quiz(question:	"An octopus can fit through any hole larger than its beak.", answer: true),
    Quiz(question:	"The 2010 film 'The Social Network' is a biographical drama film about MySpace founder Tom Anderson.", answer: false),
    Quiz(question:	"Furby was released in 1998.", answer: true),
  ];

  String getCurrentQuestion() {
    return _questionBank[_questionNumber].question;
  }

  bool getCurrentAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  int nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      return 1;
    } else {
      return -1;
    }
  }

  void resetQuestions() {
    _questionNumber = 0;
  }
}