import 'package:flutter/material.dart';

class LinePage extends StatelessWidget {
  const LinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line'),
      ),
      body: SafeArea(child:  CustomPaint(
      painter: LinePainter(),
      child: Container(),
    ),),
    );
  }
}

class LinePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {    // where draw 이것저것
    // TODO: implement paint
    Paint paint = Paint() ..strokeWidth = 3.0;

    Offset p1 = Offset(10.0, size.height/2);
    Offset p2 = Offset(size.width - 10.0, size.height/2);

    canvas.drawLine(p1, p2, paint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {    //refresh, animation stuff
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }

}