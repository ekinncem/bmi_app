import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primaryColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.fromSwatch(),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        hintColor: Colors.purple,
      ),
      home: InputPage(),
    );
  }
}

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
        child: Text('Body Text', style: TextStyle(color: Colors.white , fontSize: 20),),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print('Floating Action Button Pressed');
        },
      ),
    );
  }
}

