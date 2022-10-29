import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  final String message;
  final MainAxisAlignment position;
  final double fontSize;
  final double space;

  const Splash({
    Key? key,
    required this.message,
    this.position = MainAxisAlignment.center,
    this.fontSize = 20.0,
    this.space = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: position,
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
            SizedBox(
              height: space,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
