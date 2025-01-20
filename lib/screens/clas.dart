import 'package:flutter/material.dart';

class HeightCounter extends StatefulWidget {
  @override
  _HeightCounterState createState() => _HeightCounterState();
}

class _HeightCounterState extends State<HeightCounter> {
  int height = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Height Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Boyunuz: $height cm',
            style: TextStyle(fontSize: 20),
          ),
          Slider(
            value: height.toDouble(),
            min: 120,
            max: 240,
            divisions: 120,
            label: height.toString(),
            onChanged: (double newValue) {
              setState(() {
                height = newValue.round();
              });
            },
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: HeightCounter(),
));
