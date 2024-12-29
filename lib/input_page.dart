import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR' , style: TextStyle(fontSize: 25 , color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E21)
      ),
      body: Center(
        child: Text('Body Text'),
      ),
    );
  }
}