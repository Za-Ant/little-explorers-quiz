import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final VoidCallback onRestart;

  List<Map<String, Object>> getSummaryData() {
    return chosenAnswers.asMap().entries.map((entry) {
      return <String, Object>{
        'question_index': entry.key,
        'question': questions[entry.key].text,
        'correct_answer': questions[entry.key].answers.first,
        'user_answer': entry.value,
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final correctAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text(
            'Your Results',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Correct answers: $correctAnswers / ${questions.length}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 20),
          Expanded(child: QuestionsSummary(summaryData)),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: onRestart,
            icon: const Icon(Icons.restart_alt),
            label: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
