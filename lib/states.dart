import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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

//HEIGHTCOUNTER AND ITS STATE

class HeightCounter extends StatefulWidget{
  @override
  _HeightCounterState createState() => _HeightCounterState();
}

class _HeightCounterState extends State<HeightCounter> {
  int height = 120;

  void _incrementHeight() {
    setState(() {
      height++;
    });
  }

  void _decrementHeight() {
    setState((){
      height--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        const Text(
          'HEIGHT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height:10),
        Text(
          '$height',
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
              width: 300,
              child: Slider(
              value: height.toDouble(),
              min: 120,
              max: 240,
              divisions: 240,
              label: height.toString(),
              onChanged: (double newValue) {
                setState(() {
                  height = newValue.round();
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

//AGECOUNTER AND ITS STATE

class AgeCounter extends StatefulWidget {
  @override
  _AgeCounterState createState() => _AgeCounterState();
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