import 'package:flutter/material.dart';
import 'input_page.dart';
import 'contents.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

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
      home: SplashScreen.navigate(
        name: 'assets/trim_w.flr',
        next: (context) => InputPage(),
        until: () => Future.delayed(Duration(seconds: 0)),
        startAnimation: 'Untitled',
      ),
    );
  }
}
