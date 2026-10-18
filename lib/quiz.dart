import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'questions_screen.dart';
import 'results_screen.dart';
import 'start_screen.dart';

enum QuizScreen { start, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = QuizScreen.start;
  final List<String> selectedAnswers = [];

  void startQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = QuizScreen.questions;
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = QuizScreen.start;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = QuizScreen.results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (activeScreen) {
      case QuizScreen.start:
        screen = StartScreen(onStart: startQuiz);
        break;
      case QuizScreen.questions:
        screen = QuestionsScreen(onSelectAnswer: chooseAnswer);
        break;
      case QuizScreen.results:
        screen = ResultsScreen(
          chosenAnswers: selectedAnswers,
          onRestart: restartQuiz,
        );
        break;
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF311B92),
              Color(0xFF7B1FA2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(child: screen),
      ),
    );
  }
}