import 'questionbank.dart';
class QuizBrain {
  List<Questionbank> _questionbank = [
    Questionbank('You can lead a cow down stairs but not up stairs.', 'false'),
    Questionbank(
        'Approximately one quarter of human bones are in the feet.', 'true'),
    Questionbank('A slug\'s blood is green.', 'true')
  ];

  List<Questionbank> get questionbank => _questionbank;
}