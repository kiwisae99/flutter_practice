import 'package:flutter/material.dart';

class TrianglePage extends StatelessWidget {
  const TrianglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Rectangle'),

      ),
      body: CustomPaint(
        painter: TrianglePainter(),
        child: Container(),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint() ..strokeWidth = 3.0 ..style = PaintingStyle.stroke;

    Offset(size.width/2, size.height/2);
    Path path = Path();
    path.moveTo(size.width / 2, size.height / 3);
    path.lineTo(size.width / 4, (size.height / 3)*2);    //(80, 400)
    path.lineTo((size.width / 4)*3, (size.height / 3)*2);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }

}