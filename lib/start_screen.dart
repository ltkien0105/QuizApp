import "package:flutter/material.dart";

class StartScreen extends StatelessWidget {
  final VoidCallback startQuiz;

  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              height: 400,
              color: const Color.fromRGBO(255, 255, 255, 0.6)
            ),
            const SizedBox(height: 20),
            const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              )
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white
              ),
              icon: const Icon(Icons.arrow_right_alt_sharp),
              label: const Text(
                'Start Quiz',
              ),
            )
          ]
        ),
      );
  }
}