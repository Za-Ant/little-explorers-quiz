import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/main.dart';

void main() {
  testWidgets('Complete the quiz and return to the start screen', (
    tester,
  ) async {
    await tester.pumpWidget(const QuizApp());

    expect(find.text('Little Explorers Quiz'), findsOneWidget);

    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();

    for (var index = 0; index < questions.length; index++) {
      expect(
        find.text('Question ${index + 1} / ${questions.length}'),
        findsOneWidget,
      );

      final answer = index == 0
          ? questions[index].answers[1]
          : questions[index].answers.first;

      final answerButton = find.widgetWithText(
        ElevatedButton,
        answer,
      );

      await tester.ensureVisible(answerButton);
      await tester.tap(answerButton);
      await tester.pumpAndSettle();
    }

    expect(find.text('Your Results'), findsOneWidget);
    expect(find.text('Correct answers: 6 / 7'), findsOneWidget);
    expect(find.text('Your answer: A dolphin'), findsOneWidget);
    expect(find.text('Correct answer: An octopus'), findsOneWidget);

    await tester.tap(find.text('Restart Quiz'));
    await tester.pumpAndSettle();

    expect(find.text('Little Explorers Quiz'), findsOneWidget);
    expect(find.text('Start Quiz'), findsOneWidget);
    expect(find.text('Your Results'), findsNothing);
    expect(find.text('Question 1 / 7'), findsNothing);

    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();

    expect(find.text('Question 1 / 7'), findsOneWidget);

    for (final question in questions) {
      final answerButton = find.widgetWithText(
        ElevatedButton,
        question.answers.first,
      );

      await tester.ensureVisible(answerButton);
      await tester.tap(answerButton);
      await tester.pumpAndSettle();
    }

    expect(find.text('Correct answers: 7 / 7'), findsOneWidget);
  });
}