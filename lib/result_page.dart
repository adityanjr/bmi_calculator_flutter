import 'package:flutter/material.dart';
import 'contents.dart';

class Results extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final Widget lottieAnimation;
  Results(this.bmiResult,this.resultText,this.interpretation, this.lottieAnimation);

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
                  lottieAnimation,
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