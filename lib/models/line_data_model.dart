import 'package:flutter/material.dart';

class LineData {
  List<Offset> points;
  bool connected;

  LineData({
    required this.points,
    required this.connected,
  });
}
