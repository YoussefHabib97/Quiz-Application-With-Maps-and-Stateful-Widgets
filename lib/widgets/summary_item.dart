import 'package:flutter/material.dart';

// Widget imports
import 'question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;
  const SummaryItem(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer,
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Your answer: ${itemData['user_answer'] as String}",
                  style: TextStyle(
                    color: isCorrectAnswer ? Colors.green : Colors.pink,
                  ),
                ),
                const SizedBox(height: 8),
                isCorrectAnswer
                    ? const SizedBox()
                    : Text(
                        "Correct answer: ${itemData['correct_answer'] as String}",
                        style: const TextStyle(
                          color: Colors.green,
                        ),
                      ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
