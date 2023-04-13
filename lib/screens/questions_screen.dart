import 'package:flutter/material.dart';

// Data imports
import 'package:quiz_app/data/quiz_questions.dart';

// Package imports
import 'package:google_fonts/google_fonts.dart';

// Widget imports
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = quizQuestions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ...currentQuestion.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                    answerText: answer,
                    onPressed: () {
                      answerQuestion(answer);
                    },
                  ),
                )
          ],
        ),
      ),
    );
  }
}
