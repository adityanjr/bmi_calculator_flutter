import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contents.dart';

const activeCardColor = Color(0xFF1D1E36);
const inactiveCardColor = Color(0xFF111324);
const bottomContainerColor = Color(0xFF0171DF);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectedGender;

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
                        '180',
                        style: thickFontStyle,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'cm',
                        style: labelStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ContainerCard(colour: activeCardColor),
                ),
                Expanded(
                  child: ContainerCard(colour: activeCardColor),
                ),
              ],
            ),
          ),
          Container(
            height: 65.0,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: bottomContainerColor,
            ),
          )
        ],
      )

    );
  }
}