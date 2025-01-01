import 'package:flutter/material.dart';
import 'reusables.dart';

const bottomContainerHeight= 80.0;

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
                  child: ReusableCard(colour: Colors.blue),
                ),
                Expanded(
                  child: ReusableCard(colour: Color(0xFF1D1E33)),
                ),
              ],
            ),
          ),
          // One container in the middle
          Expanded(
            child: ReusableCard(colour: Color(0xFF1D1E33)),
          ),
          // Row with one container at the bottom
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: Color(0xFF1D1E33)),
                ),
                Expanded(
                  child: ReusableCard(colour: Color(0xFF1D1E33)),
                ),
              ],
            ),
          ),
          Container(color: Color(0xFFeB1555),
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}

