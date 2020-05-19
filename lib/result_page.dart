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
          Container(
            margin: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
            child: Center(
              child: Text(
                'YOUR RESULT',
                style: labelStyle,
              ),
            ),
          ),
          Expanded(
            child: ContainerCard(colour: activeCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 25.0,
                      color: resultText=='Normal' ? Colors.lightGreen : Colors.red,
                    ),
                  ),
                  lottieAnimation,
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 75.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
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