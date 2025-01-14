import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//RESUABLE CARD WIDGET

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

//ICON CONTENT WIDGET

class IconContent extends StatelessWidget {
  const IconContent({
    super.key, 
    required this.icon, 
    required this.text
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
        SizedBox(height: 10),
        Text(
          text ?? '', 
          style: TextStyle(
            fontSize: 18, 
            color: Colors.white
          ),
        ),
      ],
    );
  }
}


class _AgeCounterState extends State<AgeCounter> {
  int age = 0;

  void _incrementAge() {
    setState(() {
      age++;
    });
  }

  void _decrementAge() {
    setState(() {
      if (age > 0) age--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'AGE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '$age',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _decrementAge,
              icon: const Icon(Icons.remove),
              color: Colors.white,
              iconSize: 36,
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: _incrementAge,
              icon: const Icon(Icons.add),
              color: Colors.white,
              iconSize: 36,
            ),
          ],
        ),
      ],
    );
  }
}
