import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// WEIGHT COUNTER AND ITS STATE

class WeightCounter extends StatelessWidget {
  final int weight;
  final Function(int) onChanged;

  const WeightCounter({
    required this.weight,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('WEIGHT'),
        Text(
          weight.toString(),
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () => onChanged(weight - 1),
            ),
            SizedBox(width: 10),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () => onChanged(weight + 1),
            ),
          ],
        )
      ],
    );
  }
}

// HEIGHT COUNTER AND ITS STATE

class HeightCounter extends StatelessWidget {
  final int height;
  final Function(int) onChanged;

  const HeightCounter({
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('HEIGHT'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              height.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
            ),
            Text('cm'),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            thumbColor: Color(0xFFEB1555),
            overlayColor: Color(0x29EB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          ),
          child: Slider(
            value: height.toDouble(),
            min: 120.0,
            max: 220.0,
            onChanged: (double newValue) {
              onChanged(newValue.round());
            },
          ),
        ),
      ],
    );
  }
}

// AGE COUNTER AND ITS STATE

class AgeCounter extends StatelessWidget {
  final int age;
  final Function(int) onChanged;

  const AgeCounter({
    required this.age,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('AGE'),
        Text(
          age.toString(),
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () => onChanged(age - 1),
            ),
            SizedBox(width: 10),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () => onChanged(age + 1),
            ),
          ],
        )
      ],
    );
  }
}
