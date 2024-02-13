// import 'package:flutter/material.dart';

// void main() {
//   runApp(Dice());
// }

// class Dice extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       backgroundColor: Colors.red,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           const Text(
//             "Dicee App",
//             style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Image.asset('images/dice1.png'),
//               Image.asset('images/dice6.png'),
//             ],
//           ),
//         ],
//       ),
//     ));
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(Dice());
}

class Dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            RandomImagePair(), // Adding RandomImagePair widget here
          ],
        ),
      ),
    );
  }
}

class RandomImagePair extends StatefulWidget {
  @override
  _RandomImagePairState createState() => _RandomImagePairState();
}

class _RandomImagePairState extends State<RandomImagePair> {
  List<String> images = [
    'images/dice1.png',
    'images/dice2.png',
    'images/dice3.png',
    'images/dice4.png',
    'images/dice5.png',
    'images/dice6.png',
  ];
  List<String> selectedImages = [];

  void generateRandomPair() {
    // Clear the previous selected images
    selectedImages.clear();

    // Shuffle the list of images
    images.shuffle();

    // Select the first two images from the shuffled list
    selectedImages.addAll(images.take(2));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (selectedImages.isNotEmpty)
          Image.asset(
            selectedImages[0],
            width: 100,
            height: 100,
          ),
        if (selectedImages.isNotEmpty)
          Image.asset(
            selectedImages[1],
            width: 100,
            height: 100,
          ),
        ElevatedButton(
          onPressed: generateRandomPair,
          child: Text('Generate Random Pair'),
        ),
      ],
    );
  }
}
