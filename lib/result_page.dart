import 'package:bmicalculator/input_page.dart';
import 'package:flutter/material.dart';
import 'contents.dart';
import 'package:lottie/lottie.dart';

class Results extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;
  Results(this.bmiResult,this.resultText,this.interpretation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Your Result',
                style: labelStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ContainerCard(colour: activeCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Lottie.network('https://assets6.lottiefiles.com/packages/lf20_2DbwUj.json',
                    height: 200.0,
                    width: 200.0),
                  Text(
                    resultText.toUpperCase(),
                    style: labelStyle,
                  ),
                  Text(
                    bmiResult,
                    style: thickFontStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      interpretation,
                      style: labelStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(buttonText: 'RECALCULATE', onTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}