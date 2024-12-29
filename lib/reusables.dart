import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

const ReusableCard({super.key, required this.colour});

final Color colour;
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