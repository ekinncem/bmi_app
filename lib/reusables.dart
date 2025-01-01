import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key, 
    required this.colour, 
    required this.cardChild
  });

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Icon(
            FontAwesomeIcons.venus, 
            size: 80,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'FEMALE', 
          style: TextStyle(
            fontSize: 18, 
            color: Colors.white
          ),
        ),
      ],
    );
  }
}