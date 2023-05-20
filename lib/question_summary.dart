import 'package:flutter/material.dart';

class QuestionSummaryy extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionSummaryy(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: 
                            (data['question_index'] as int).isEven
                            ?const Color.fromARGB(255, 235, 124, 161)
                            :const Color.fromARGB(255, 175, 180, 225),
                          ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            width: double.infinity,
                            child: Text(
                              data['question'] as String,
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Your answer: ${data['user_answer'] as String}',
                              style: const TextStyle(color: Color.fromARGB(255, 205, 90, 225)),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Correct answer: ${data['correct_answer'] as String}',
                              style: const TextStyle(color: Color.fromARGB(255, 102, 171, 228)),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
