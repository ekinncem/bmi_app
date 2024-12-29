import 'package:flutter/material.dart';
import 'reusablecard.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        children: <Widget>[
          // Row with two containers at the top
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                ),
              ],
            ),
          ),
          // One container in the middle
          Expanded(
            child: ReusableCard(),
          ),
          // Row with one container at the bottom
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

