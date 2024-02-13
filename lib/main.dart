import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatefulWidget {
  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int diceNumber1 = 1;
  int diceNumber2 = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: GestureDetector(
      onTap: () {
        genRandomNumber();
        print("Screen Tapped");
      },
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Dicee App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('images/dice$diceNumber1.png'),
                Image.asset('images/dice$diceNumber2.png'),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  void genRandomNumber() async {
    Random random = Random();
    for (int i = 0; i < 15; i++) {
      await Future.delayed(const Duration(milliseconds: 100), () {
        diceNumber1 = random.nextInt(6) + 1;
        diceNumber2 = random.nextInt(6) + 1;
        setState(() {});
      });
    }
    ;
  }
}
