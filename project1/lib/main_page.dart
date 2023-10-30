// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project1/circle_page.dart';
import 'package:project1/curves_page.dart';
import 'package:project1/line_page.dart';
import 'package:project1/rectangle_page.dart';
import 'package:project1/triangle_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Custom Paint Basics'),
        // bottom: TabBar(
        //   isScrollable: true,
        //   controller: controller,
        // ),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) => LinePage(),));
        }, child: Text('Line')),
         ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) => CirclePage(),));
        }, child: Text('Circle')),
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) => RectanglePage(),));
        }, child: Text('Rectangle')),
         ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) => TrianglePage(),));
        }, child: Text('Triangle')),
         ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) => CurvesPage(),));
        }, child: Text('Curves')),
        
      ],),
    ),);
  }
}