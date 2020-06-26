import 'package:flutter/material.dart';
import 'package:networkcall/temprature_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TempratureWidget(),
    );
  }
}




