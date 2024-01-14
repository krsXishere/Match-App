import 'package:flutter/cupertino.dart';
import '../models/line_data_model.dart';
import '../models/question_answer_model.dart';

class QuestionAnswerProvider with ChangeNotifier {
  final List<QuestionAnswerModel> _questions = [
    QuestionAnswerModel(
      questionImagePath: "assets/png/wortel-kotak.png",
      correctAnswerImagePath: "assets/png/5-pink.png",
    ),
  ];
  final List<LineData> _lines = [];
  final List<Offset> _currentPoints = [];
  List<QuestionAnswerModel> get questions => _questions;
  List<LineData> get lines => _lines;
  List<Offset> get currentPoints => _currentPoints;

  void addPoint(Offset point) {
    _currentPoints.add(point);
    notifyListeners();
  }

  void addLine() {
    if (_currentPoints.length == 2) {
      _lines.add(
        LineData(
          points: List.from(_currentPoints),
          connected: true,
        ),
      );
      _currentPoints.clear();
      notifyListeners();
    }
  }
}
