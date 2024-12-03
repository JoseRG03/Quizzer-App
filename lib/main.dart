import 'package:flutter/material.dart';
import 'package:quizzer/views/quiz_page.dart';

void main() => runApp(Quiz_App());

class Quiz_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey.shade900,
            title: Text('Quiz App', style: TextStyle(
                color: Colors.white
            ),
            )),
        body: QuizPage(),
      ),
    );
  }
}
