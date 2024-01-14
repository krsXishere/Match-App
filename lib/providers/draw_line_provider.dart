import 'package:flutter/material.dart';

class DrawLineProvider with ChangeNotifier {
  final List<Offset> _points = [];
  List<Offset> get points => _points;
  final List<List<Offset>> _lines = [];
  List<List<Offset>> get lines => _lines;

  void getPoints(Offset point) {
    _points.add(point);
    notifyListeners();
  }

  void getLines() {
    _lines.add(List.from(_points));
    _points.clear();
    notifyListeners();
  }

  void disposeDrawLineProvider() {
    _lines.clear();
    _points.clear();
  }
}
