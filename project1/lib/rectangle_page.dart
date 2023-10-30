import 'package:flutter/material.dart';

class RectanglePage extends StatelessWidget {
  const RectanglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rectangle'),
      ),
      body: SafeArea(child:  CustomPaint(
      painter: RectanglePainter(),
      child: Container(),
    ),),
    );
  }
}

class RectanglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {    // where draw 이것저것
    // TODO: implement paint
    Paint paint = Paint() ..strokeWidth = 3.0
    ..style = PaintingStyle.stroke;   


    Offset center = Offset(size.width/2, size.height/2);
    Rect rect = Rect.fromCircle(center: center, radius: 70.0);
    canvas.drawRect(rect, paint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {    //refresh, animation stuff
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }

}