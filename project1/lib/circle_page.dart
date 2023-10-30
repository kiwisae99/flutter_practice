import 'package:flutter/material.dart';

class CirclePage extends StatelessWidget {
  const CirclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle'),
      ),
      body: SafeArea(child:  CustomPaint(
      painter: CirclePainter(),
      child: Container(),
    ),),
    );
  }
}

class CirclePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {    // where draw 이것저것
    // TODO: implement paint
    Paint paint = Paint() ..strokeWidth = 3.0
    ..style = PaintingStyle.stroke;   


    Offset center = Offset(size.width/2, size.height/2);

    canvas.drawCircle(center, 70, paint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {    //refresh, animation stuff
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }

}