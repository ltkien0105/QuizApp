import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/data/questions.dart';

class ResultScreen extends StatefulWidget {
  final List<String> chosenAnswer;
  final VoidCallback restartQuiz;
  const ResultScreen(this.chosenAnswer, this.restartQuiz, {super.key});

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].questionText,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswer[i]
        },
      );
    }

    return summary;
  }

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final getSummaryData = widget.summaryData;
    final totalQuestion = questions.length;
    final numCorrectAnswer = getSummaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answer $numCorrectAnswer out of $totalQuestion questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummaryy(getSummaryData),
            const SizedBox(height: 30),
            TextButton(
              onPressed: widget.restartQuiz,
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
