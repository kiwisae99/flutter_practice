import 'package:flutter/material.dart';
import 'package:project2/model/drawing_mode.dart';

class Sketch {
  final List<Offset> points;
  final Color color;
  final double size;
  final DrawingMode mode;

  Sketch({
    required this.points,
    this.color = Colors.black,
     this.size = 10,
     this.mode = DrawingMode.pencil,
  });
}