import 'package:flutter/material.dart';
import 'package:quizzer/controllers/quiz_controller.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

import '../components/my_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final quizBrain = QuizController();
  List<Icon> scores = [];
  int scoreCounter = 0;

  void checkCurrentAnswer(bool userAnswer) {
    setState(() {
      final currentAnswer = quizBrain.getCurrentAnswer();
      if (currentAnswer == userAnswer) {
        scores.add(Icon(Icons.check, color: Colors.green));
        scoreCounter++;
      } else {
        scores.add(Icon(Icons.close, color: Colors.red));
      }

    if (quizBrain.nextQuestion() != 1)  {
      showOkAlertDialog(context: context, title: "Quiz Complete!", message: "${"Final Score: $scoreCounter"}/3");
      quizBrain.resetQuestions();
      scores.clear();
      scoreCounter = 0;
    }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                      textAlign: TextAlign.center,
                      quizBrain.getCurrentQuestion(), style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
                )
            ),
            MyButton(
              onTap: () { checkCurrentAnswer(true); },
              buttonColor: Colors.green,
              buttonText: "True",
            ),
            const SizedBox(height: 20),
            MyButton(
              onTap: () { checkCurrentAnswer(false); },
              buttonColor: Colors.red,
              buttonText: "False",
            ),
            const SizedBox(height: 50),
            Row(
              children: scores,
            )
          ],
        ),
      ),
    );
  }
}