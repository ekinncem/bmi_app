import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// REUSABLE CARD WIDGET

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key, 
    required this.colour, 
    required this.cardChild,
  });

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}

// ICON CONTENT WIDGET

class IconContent extends StatelessWidget {
  const IconContent({
    super.key, 
    required this.icon, 
    required this.text,
  });

  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Icon(
            icon, 
            size: 80,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text ?? '', 
          style: const TextStyle(
            fontSize: 18, 
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
