import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswer = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchQuestionScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    _selectedAnswer.add(answer);
    if (_selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(_selectedAnswer, restartQuiz);
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswer.clear();
      activeScreen = QuestionScreen(chooseAnswer);
    });
  }

  void switchQuestionScreen() {
    setState(() {
      activeScreen = QuestionScreen(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(78, 13, 151, 1),
                Color.fromRGBO(107, 15, 168, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
