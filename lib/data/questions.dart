class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List<String>.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}

const questions = [
  QuizQuestion('Which animal has three hearts?', [
    'An octopus',
    'A dolphin',
    'A shark',
    'A penguin',
  ]),
  QuizQuestion('Which planet is famous for its beautiful rings?', [
    'Saturn',
    'Mars',
    'Earth',
    'Mercury',
  ]),
  QuizQuestion('What does a caterpillar turn into?', [
    'A butterfly or a moth',
    'A ladybug',
    'A spider',
    'A dragonfly',
  ]),
  QuizQuestion('Which animal is the tallest in the world?', [
    'A giraffe',
    'An elephant',
    'An ostrich',
    'A camel',
  ]),
  QuizQuestion('What is the Sun?', [
    'A star',
    'A planet',
    'A giant lamp',
    'A moon',
  ]),
  QuizQuestion('Which of these animals can fly?', [
    'A bat',
    'A penguin',
    'An ostrich',
    'A kiwi',
  ]),
  QuizQuestion('What do you get when you mix blue and yellow paint?', [
    'Green',
    'Purple',
    'Orange',
    'Pink',
  ]),
];
