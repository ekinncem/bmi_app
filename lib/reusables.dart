import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

const ReusableCard({super.key, required this.colour, required this.child});

final Color colour;
final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}