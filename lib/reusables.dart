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

//WEIGHTCOUNTER AND ITS STATE

class WeightCounter extends StatefulWidget {
  @override
  _WeightCounterState createState() => _WeightCounterState();
}


class _WeightCounterState extends State<WeightCounter> {
  int weight = 100;

  void _incrementWeight() {
    setState(() {
      weight++;
    });
  }

  void _decrementWeight() {
    setState((){
      weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        const Text(
          'WEIGHT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height:10),
        Text(
          '$weight',
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
            SizedBox(
              width: 150,
              child: Slider(
              value: weight.toDouble(),
              min: 100,
              max: 300,
              divisions: 240,
              label: weight.toString(),
              activeColor: Colors.pink,
              onChanged: (double newValue) {
                setState(() {
                  weight = newValue.round();
                });
              },
                        ),
            ),
          ],
        ),
      ]
    );
  }
}



