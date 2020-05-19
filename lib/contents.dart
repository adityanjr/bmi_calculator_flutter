import 'package:flutter/material.dart';

//COLORS
const mainBackgroundColor = Color(0xFF16172E);
const activeCardColor = Color(0xFF1D1E36);
const inactiveCardColor = Color(0xFF111324);
const bottomContainerColor = Color(0xFF0171DF);
const cardLabelColor = Color(0xFF8D8E98);

//Text Styles
const labelStyle = TextStyle(
    fontSize: 18.0,
    color: cardLabelColor,
);

const thickFontStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

//CLASSES
class IconContent extends StatelessWidget {

  final IconData icon;
  final String text;
  IconContent(this.icon,this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          text,
          style: labelStyle
        ),
      ],
    );
  }
}

class ContainerCard extends StatelessWidget {

  ContainerCard({@required this.colour, this.childCard});
  final Color colour;
  final Widget childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        //Color(0xFF1D1E36),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}

class MyButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;
  MyButton({this.icon,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      fillColor: cardLabelColor,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  final String buttonText;
  final Function onTap;
  BottomButton({this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomContainerColor,
        height: 65.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15.0),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}