import 'package:flutter/material.dart';

const labelStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xFF8D8E98)
);

const thickFontStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

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