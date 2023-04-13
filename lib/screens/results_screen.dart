import 'package:flutter/material.dart';

// Data imports
import 'package:quiz_app/data/quiz_questions.dart';

// Widget imports
import 'package:quiz_app/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() onRestart;

  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': quizQuestions[i].text,
        'correct_answer': quizQuestions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final int numTotalQuestions = quizQuestions.length;
    final int numCorrectQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 32),
            QuestionsSummary(summaryData),
            const SizedBox(height: 32),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz!"),
            ),
          ],
        ),
      ),
    );
  }
}
