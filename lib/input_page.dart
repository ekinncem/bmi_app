import 'package:flutter/material.dart';
import 'reusables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const maleActiveCardColur = Color.fromARGB(255, 30, 37, 163);
const maleInactiveCardColour = Color.fromARGB(255, 99, 99, 236);
const femaleActiveCardColour = Color.fromARGB(255, 163, 30, 30);
const femaleInactiveCardColour = Color.fromARGB(255, 204, 87, 87);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColor = Color(0xFFFFC0CB); // More beautiful pink color

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> with SingleTickerProviderStateMixin {
  Color maleCardColour = maleInactiveCardColour;
  Color femaleCardColour = femaleInactiveCardColour;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      } else {
        maleCardColour = inactiveCardColour;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE'
                      )
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
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE'
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
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: bottomContainerColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContainerHeight,
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  double screenWidth = MediaQuery.of(context).size.width;
                  return Positioned(
                    left: screenWidth * _animation.value - 25,
                    top: 2,
                    child: SizedBox(
                      width: 110,
                      height: 110,
                      child: Lottie.asset('assets/animations/cyclist.json'),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
