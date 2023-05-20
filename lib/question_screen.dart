import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;
  const QuestionScreen(this.onSelectAnswer, {super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    void changeQuestion(String answer) {
      widget.onSelectAnswer(answer);
      if(currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
        });
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ...currentQuestion.getShuffledList().map(
              (answer) {
                return AnswerButton(
                  answer,
                  () {
                    changeQuestion(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
