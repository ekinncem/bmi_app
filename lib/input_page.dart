import 'package:flutter/material.dart';
import 'reusables.dart';
import 'states.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart'; // Ensure this line is present to import ResultPage
import 'package:lottie/lottie.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const maleActiveCardColour = Color.fromARGB(255, 99, 99, 236);
const maleInactiveCardColour = Color.fromARGB(255, 162, 164, 207);
const femaleActiveCardColour = Color.fromARGB(255, 204, 87, 87);
const femaleInactiveCardColour = Color.fromARGB(255, 165, 135, 135);
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

  // Add these variables to store the values
  int height = 180;
  int weight = 60;
  int age = 20;

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
    setState(() {
      if (selectedGender == Gender.male) {
        if (maleCardColour == maleInactiveCardColour) {
          maleCardColour = maleActiveCardColour;
          femaleCardColour = femaleInactiveCardColour;
        } else {
          maleCardColour = maleInactiveCardColour;
        }
      } else if (selectedGender == Gender.female) {
        if (femaleCardColour == femaleInactiveCardColour) {
          femaleCardColour = femaleActiveCardColour;
          maleCardColour = maleInactiveCardColour;
        } else {
          femaleCardColour = femaleInactiveCardColour;
        }
      }
    });
  }

  double calculateBMI() {
    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);
    // Format to 3 decimal places
    return double.parse(bmi.toStringAsFixed(3));
  }

  String getResult() {
    double bmi = calculateBMI();
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    double bmi = calculateBMI();
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You should eat more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A0E21),
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
                        text: 'MALE',
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
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
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
              cardChild: HeightCounter(
                height: height,
                onChanged: (newHeight) {
                  setState(() {
                    height = newHeight;
                  });
                },
              ),
            ),
          ),
          // Row with one container at the bottom
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: WeightCounter(
                      weight: weight,
                      onChanged: (newWeight) {
                        setState(() {
                          weight = newWeight;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: AgeCounter(
                      age: age,
                      onChanged: (newAge) {
                        setState(() {
                          age = newAge;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: bottomContainerColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContainerHeight,
                child: TextButton(
                  onPressed: () {
                    // Calculate BMI here using height and weight values
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmiResult: calculateBMI().toString(), // Add your calculation method
                          resultText: getResult(), // Add your result text method
                          interpretation: getInterpretation(), // Add your interpretation method
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'CALCULATE YOUR BMI',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
