import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contents.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Results extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  final Widget lottieAnimation;
  Results(this.bmiResult, this.resultText, this.interpretation,
      this.lottieAnimation);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(24.0, 20.0, 0, 0),
              child: Text('YOUR RESULT',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Moderne',
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  )),
            ),
            Expanded(
              child: ContainerCard(
                colour: activeCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 28.0,
                        fontFamily: 'Moderne',
                        color: resultText == 'Normal'
                            ? Colors.lightGreen
                            : Colors.red,
                      ),
                    ),
                    lottieAnimation,
                    SizedBox(
                      width: 200.0,
                      child: TextLiquidFill(
                        text: bmiResult,
                        waveColor: Colors.lightBlue,
                        loadDuration: Duration(milliseconds: 1500),
                        textStyle: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                        boxHeight: 75.0,
                        boxBackgroundColor: activeCardColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Text(
                        interpretation,
                        style: labelStyle(Color(0xFFEBF4FA)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonText: 'RECALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
