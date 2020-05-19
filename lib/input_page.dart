import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contents.dart';
import 'result_page.dart';
import 'calculator.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  //initial state values
  String selectedGender;
  int height = 160;
  int weight = 65;
  int age = 19;

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
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = 'male';
                      });
                    },
                    child: ContainerCard(colour: selectedGender=='male' ? activeCardColor : inactiveCardColor,
                      childCard: IconContent(FontAwesomeIcons.mars,'MALE')),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = 'female';
                      });
                    },
                    child: ContainerCard(colour: selectedGender=='female' ? activeCardColor : inactiveCardColor,
                      childCard: IconContent(FontAwesomeIcons.venus, 'FEMALE'),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerCard(colour: activeCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: thickFontStyle,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 150.0,
                    max: 180.0,
                    inactiveColor: inactiveCardColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ContainerCard(colour: activeCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: labelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: thickFontStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MyButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },),
                          SizedBox(width: 15.0,),
                          MyButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                        ],
                      )
                    ],
                  ),
                  ),
                ),
                Expanded(
                  child: ContainerCard(colour: activeCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: thickFontStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                            SizedBox(width: 15.0,),
                            MyButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonText: 'CALCULATE', onTap: (){
            Calculator calc = Calculator(height: height, weight: weight);
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> Results(calc.calculateBMI(),
                calc.getResult(), calc.getInterpretation(), calc.getAnimation()),
                ));
          },),
        ],
      )

    );
  }
}