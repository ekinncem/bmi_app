import 'package:flutter/material.dart';
import 'reusables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender { 
  male ,
  female
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  void updateColour(Gender selectedGender) {
    if(selectedGender == Gender.male){
      if(maleCardColour == inactiveCardColour){
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      } else{
        maleCardColour = inactiveCardColour;
      }
    }
    if(selectedGender == Gender.female){
      if(femaleCardColour == inactiveCardColour){
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      } else{
        femaleCardColour = inactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Lottie.asset(
                'assets/achivement.json',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'BMI CALCULATOR',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(width: 10),
            SizedBox(
              height: 40,
              width: 40,
              child: Lottie.asset(
                'assets/achivement.json',
                fit: BoxFit.contain,
              ),
            ),
          ],
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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                            width: 150,
                            child: Lottie.asset(
                              'assets/male.json',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                print('Lottie Error: $error');
                                return Icon(
                                  FontAwesomeIcons.venus,
                                  size: 80,
                                  color: Colors.white,
                                );
                              },
                            ),
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                            width: 150,
                            child: Lottie.asset(
                              'assets/female.json',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                print('Lottie Error: $error');
                                return Icon(
                                  FontAwesomeIcons.venus,
                                  size: 80,
                                  color: Colors.white,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // One container in the middle
          Expanded(
            child: ReusableCard(
              colour: activeCardColour,
              cardChild: Container(),
            ),
          ),
          // Row with one container at the bottom
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: Container(),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: Container(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
