// // import 'dart:async';
// // import 'package:flutter/material.dart';

// // class GamePage extends StatefulWidget {
// //   const GamePage({Key? key}) : super(key: key);

// //   @override
// //   _GamePageState createState() => _GamePageState();
// // }

// // class _GamePageState extends State<GamePage> {
// //   late List<int> cards;
// //   late List<bool> cardFlips;
// //   late int firstCardIndex;
// //   late int secondCardIndex;
// //   late bool isSecondCard;
// //   late bool isChecking;
// //   late Timer timer;

// //   @override
// //   void initState() {
// //     super.initState();
// //     cards = List.generate(6, (index) => index ~/ 2);
// //     cards.shuffle();
// //     cardFlips = List.generate(6, (index) => false);
// //     firstCardIndex = -1;
// //     secondCardIndex = -1;
// //     isSecondCard = false;
// //     isChecking = false;

// //     startGame();
// //   }

// //   void startGame() {
// //     timer = Timer(Duration(seconds: 5), () {
// //       setState(() {
// //         cardFlips = List.generate(6, (index) => true);
// //       });
// //     });
// //   }

// //   void flipCard(int index) {
// //     if (!isChecking && !cardFlips[index]) {
// //       setState(() {
// //         cardFlips[index] = true;

// //         if (!isSecondCard) {
// //           firstCardIndex = index;
// //           isSecondCard = true;
// //         } else {
// //           secondCardIndex = index;
// //           isChecking = true;

// //           if (cards[firstCardIndex] == cards[secondCardIndex]) {
// //             // Matched
// //             Timer(Duration(seconds: 1), () {
// //               setState(() {
// //                 cardFlips[firstCardIndex] = true;
// //                 cardFlips[secondCardIndex] = true;
// //                 resetTurn();
// //               });
// //             });
// //           } else {
// //             // Not matched
// //             Timer(Duration(seconds: 1), () {
// //               setState(() {
// //                 cardFlips[firstCardIndex] = false;
// //                 cardFlips[secondCardIndex] = false;
// //                 resetTurn();
// //               });
// //             });
// //           }
// //         }
// //       });
// //     }
// //   }

// //   void resetTurn() {
// //     firstCardIndex = -1;
// //     secondCardIndex = -1;
// //     isSecondCard = false;
// //     isChecking = false;

// //     // Check if all cards are flipped
// //     if (!cardFlips.contains(false)) {
// //       // Game Over: All cards matched
// //       // You can add your own logic here
// //       showDialog(
// //         context: context,
// //         builder: (context) {
// //           return AlertDialog(
// //             title: Text('Game Over'),
// //             content: Text('Congratulations! You matched all cards.'),
// //             actions: [
// //               TextButton(
// //                 onPressed: () {
// //                   Navigator.pop(context);
// //                   Navigator.pop(context); // Pop the GamePage
// //                 },
// //                 child: Text('OK'),
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     timer.cancel();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Card Matching Game'),
// //       ),
// //       body: GridView.builder(
// //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 3,
// //         ),
// //         itemCount: cards.length,
// //         itemBuilder: (context, index) {
// //           return Padding(
// //             padding: EdgeInsets.all(8.0),
// //             child: GestureDetector(
// //               onTap: () {
// //                 flipCard(index);
// //               },
// //               child: Container(
// //                 color: cardFlips[index] ? Colors.green : Colors.blue,
// //                 child: Center(
// //                   child: Text(
// //                     cardFlips[index] ? '${cards[index]}' : '?',
// //                     style: TextStyle(
// //                       fontSize: 24.0,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(
// //     home: GamePage(),
// //   ));
// // }

// import 'dart:async';
// import 'package:flutter/material.dart';

// class GamePage extends StatefulWidget {
//   const GamePage({Key? key}) : super(key: key);

//   @override
//   _GamePageState createState() => _GamePageState();
// }

// class _GamePageState extends State<GamePage> {
//   late List<int> cards;
//   late List<bool> cardFlips;
//   late int firstCardIndex;
//   late int secondCardIndex;
//   late bool isSecondCard;
//   late bool isChecking;
//   late Timer timer;

//   @override
//   void initState() {
//     super.initState();
//     cards = List.generate(6, (index) => index ~/ 2);
//     cards.shuffle();
//     cardFlips = List.generate(6, (index) => false);
//     firstCardIndex = -1;
//     secondCardIndex = -1;
//     isSecondCard = false;
//     isChecking = false;

//     startGame();
//   }

//   void startGame() {
//     timer = Timer(Duration(seconds: 5), () {
//       setState(() {
//         cardFlips = List.generate(6, (index) => true);
//       });
//     });
//   }

//   void flipCard(int index) {
//     if (!isChecking && (!cardFlips[index] || cardFlips[index])) {
//       setState(() {
//         cardFlips[index] = true;

//         if (!isSecondCard) {
//           firstCardIndex = index;
//           isSecondCard = true;
//         } else {
//           secondCardIndex = index;
//           isChecking = true;

//           if (cards[firstCardIndex] == cards[secondCardIndex]) {
//             // Matched
//             Timer(Duration(seconds: 1), () {
//               setState(() {
//                 cardFlips[firstCardIndex] = true;
//                 cardFlips[secondCardIndex] = true;
//                 resetTurn();
//               });
//             });
//           } else {
//             // Not matched
//             Timer(Duration(seconds: 1), () {
//               setState(() {
//                 cardFlips[firstCardIndex] = false;
//                 cardFlips[secondCardIndex] = false;
//                 resetTurn();
//               });
//             });
//           }
//         }
//       });
//     }
//   }

//   void resetTurn() {
//     firstCardIndex = -1;
//     secondCardIndex = -1;
//     isSecondCard = false;
//     isChecking = false;

//     // Check if all cards are flipped
//     if (!cardFlips.contains(false)) {
//       // Game Over: All cards matched
//       // You can add your own logic here
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Game Over'),
//             content: Text('Congratulations! You matched all cards.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   Navigator.pop(context); // Pop the GamePage
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Card Matching Game'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//         ),
//         itemCount: cards.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 flipCard(index);
//               },
//               child: Container(
//                 color: cardFlips[index] ? Colors.green : Colors.blue,
//                 child: Center(
//                   child: Text(
//                     cardFlips[index] ? '${cards[index]}' : '?',
//                     style: TextStyle(
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: GamePage(),
//   ));
// }

import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GamePage(),
  ));
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<int> cards;
  late List<bool> cardFlips;
  late int firstCardIndex;
  late int secondCardIndex;
  late bool isSecondCard;
  late bool isChecking;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    cards = List.generate(6, (index) => index ~/ 2);
    cards.shuffle();
    cardFlips = List.generate(6, (index) => false);
    firstCardIndex = -1;
    secondCardIndex = -1;
    isSecondCard = false;
    isChecking = false;

    startGame();
  }

  void startGame() {
    timer = Timer(Duration(seconds: 5), () {
      setState(() {
        cardFlips = List.generate(6, (index) => true);
      });
    });
  }

  void flipCard(int index) {
    if (!isChecking && !cardFlips[index]) {
      setState(() {
        cardFlips[index] = true;

        if (!isSecondCard) {
          firstCardIndex = index;
          isSecondCard = true;
        } else {
          secondCardIndex = index;
          isChecking = true;

          if (cards[firstCardIndex] == cards[secondCardIndex]) {
            // Matched
            Timer(Duration(seconds: 1), () {
              setState(() {
                cardFlips[firstCardIndex] = true;
                cardFlips[secondCardIndex] = true;
                resetTurn();
              });
            });
          } else {
            // Not matched
            Timer(Duration(seconds: 1), () {
              setState(() {
                cardFlips[firstCardIndex] = false;
                cardFlips[secondCardIndex] = false;
                resetTurn();
              });
            });
          }
        }
      });
    }
  }

  void resetTurn() {
    firstCardIndex = -1;
    secondCardIndex = -1;
    isSecondCard = false;
    isChecking = false;

    // Check if all pairs of cards are flipped
    bool allPairsFlipped = true;
    for (int i = 0; i < cards.length - 1; i++) {
      if (!cardFlips[i * 2] || !cardFlips[i * 2 + 1]) {
        allPairsFlipped = false;
        break;
      }
    }

    if (allPairsFlipped) {
      // Game Over: All cards matched
      // You can add your own logic here
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text('Congratulations! You matched all cards.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context); // Pop the GamePage
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Matching Game'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                flipCard(index);
              },
              child: Container(
                color: cardFlips[index] ? Colors.green : Colors.blue,
                child: Center(
                  child: Text(
                    cardFlips[index] ? '${cards[index]}' : '?',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
