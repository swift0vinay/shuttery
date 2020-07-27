import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
class HomePageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientText(
      "SHUTTERY",gradient: LinearGradient(
      colors: [
        Colors.redAccent,Colors.blueAccent,Colors.greenAccent
      ],
    ),
      style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1.25),
    );
  }
}
