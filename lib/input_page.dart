import 'package:flutter/material.dart';
import 'contents.dart';
import 'result_page.dart';
import 'result_calc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'background.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //initial state values
  String selectedGender = 'male';
  int height = 160;
  int weight = 65;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Moderne',
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'male';
                      });
                    },
                    child: ContainerCard(
                      colour: selectedGender == 'male'
                          ? genderActiveColor
                          : Colors.white,
                      childCard: IconContent(
                          icon: FontAwesome5.male,
                          text: 'MALE',
                          colour: selectedGender == 'male'
                              ? genderActiveButton
                              : Colors.grey),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'female';
                      });
                    },
                    child: ContainerCard(
                      colour: selectedGender == 'female'
                          ? genderActiveColor
                          : Colors.white,
                      childCard: IconContent(
                          icon: FontAwesome5.female,
                          text: 'FEMALE',
                          colour: selectedGender == 'female'
                              ? genderActiveButton
                              : Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerCard(
              colour: heightBackgroundColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelStyle(heightActiveColor),
                  ),
                  SizedBox(height: 8.0),
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
                            color: heightActiveColor,
                            fontSize: 25.0,
                            fontFamily: 'Moderne',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    inactiveColor: heightInactiveColor,
                    activeColor: heightActiveColor,
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
                  child: ContainerCard(
                    colour: weightBackgroundColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelStyle(weightActiveColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            weight.toString(),
                            style: thickFontStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyButton(
                              colour: weightActiveColor,
                              icon: FontAwesome5.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 10) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            MyButton(
                              icon: FontAwesome5.plus,
                              colour: weightActiveColor,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    colour: ageBackgroundColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelStyle(ageActiveColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            age.toString(),
                            style: thickFontStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyButton(
                              colour: ageActiveColor,
                              icon: FontAwesome5.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            MyButton(
                              colour: ageActiveColor,
                              icon: FontAwesome5.plus,
                              onPressed: () {
                                setState(() {
                                  if (age < 100) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(
                        calc.calculateBMI(),
                        calc.getResult(),
                        calc.getInterpretation(),
                        calc.getAnimation()),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
