import 'package:flutter/material.dart';

class CurvesPage extends StatelessWidget {
  const CurvesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Curves'),
      ),
      body: SafeArea(child: CustomPaint(
        painter: CurvesPainter(),
        child: Container(),
      )),
    );
  }
}

class CurvesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
      Paint paint = Paint() ..strokeWidth = 3.0 ..style = PaintingStyle.fill;
      var path = Path()
      ..moveTo(0,0) ..lineTo(0.0, 200) ..quadraticBezierTo(size.width / 2, 250, size.width, 200) ..lineTo(size.width, 200) ..lineTo(size.width, 0) ..close();
      canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }
    
}