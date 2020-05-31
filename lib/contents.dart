import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

//COLORS
const mainBackgroundColor = Color(0xFF16172F);
const activeCardColor = Color(0xFF1D1E36);
const inactiveCardColor = Color(0xFF111324);
const bottomContainerColor = Color(0xFF0276FD);
const cardLabelColor = Color(0xFF00CDCD);

//Text Styles
TextStyle labelStyle(Color colour) {
  return TextStyle(fontSize: 15.0, color: colour, fontFamily: 'Kayak');
}

const thickFontStyle = TextStyle(
    fontSize: 30.0, fontWeight: FontWeight.w900, fontFamily: 'Moderne');

//CLASSES
class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colour;
  final Color textColour;
  IconContent({this.icon, this.text, this.colour, this.textColour});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
          color: colour,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(text, style: labelStyle(textColour)),
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
    return Card(
      child: childCard,
      color: colour,
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  MyButton({this.icon, this.onPressed});

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
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Moderne'),
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
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: animationType),
    );
  }
}
