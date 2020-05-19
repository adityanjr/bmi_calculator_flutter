import 'package:flutter/material.dart';
import 'input_page.dart';
import 'contents.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mainBackgroundColor,
        primaryColor: mainBackgroundColor,
      ),
      home: InputPage(),
    );
  }
}