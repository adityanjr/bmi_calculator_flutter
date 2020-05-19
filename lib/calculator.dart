import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class Calculator {
  Calculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  Widget getAnimation() {
    if (getResult() == 'Overweight') {
      return Lottie.network(
          'https://assets5.lottiefiles.com/packages/lf20_c4TObF.json',
          height: 200.0, width: 200.0);
    }
    else if(getResult()=='Normal'){
      return Lottie.network(
          'https://assets6.lottiefiles.com/packages/lf20_LoU6vj.json',
          height: 200.0, width: 200.0);
    }
    else{
      return Lottie.network(
          'https://assets3.lottiefiles.com/packages/lf20_YyZFnH.json',
          height: 200.0, width: 200.0);
    }
  }
}