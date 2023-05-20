class QuizQuestion {
  final String questionText;
  final List<String> answers;

  const QuizQuestion(this.questionText, this.answers);

  List<String> getShuffledList() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}