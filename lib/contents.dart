import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

//COLORS
const mainBackgroundColor = Color(0xFF16172E);
const activeCardColor = Color(0xFF1D1E36);
const inactiveCardColor = Color(0xFF111324);
const bottomContainerColor = Color(0xFF0171DF);
const cardLabelColor = Color(0xFF8D8E98);

//Text Styles
const labelStyle = TextStyle(
    fontSize: 15.0,
    color: cardLabelColor,
);

const thickFontStyle = TextStyle(
  fontSize: 30.0,
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
          size: 60.0,
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
      elevation: 3.0,
      fillColor: cardLabelColor,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
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
        height: 55.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15.0),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class FlareWidget extends StatelessWidget {
  FlareWidget(this.animationType);
  final String animationType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      child: FlareActor("assets/Teddy.flr",
          alignment:Alignment.center,
          fit:BoxFit.contain,
          animation: animationType
      ),
    );
  }
}