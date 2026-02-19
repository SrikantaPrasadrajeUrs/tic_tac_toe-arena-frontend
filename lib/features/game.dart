import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/app_navigation/navigation.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final String X = "X", O = "O";
  List<String> cellValues = List.filled(9, "");
  bool isEmptyBoard = true, turns = false;
  static const List<List<int>> _winPatterns = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      body: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              handleTap(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(child: Text(cellValues[index])),
            ),
          );
        },
      ),
    );
  }

  void showWinDialog(String result) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(result == "Draw" ? "Its a Draw" : "$result Wins"),
          content: const Text(
            "Do you want to play again?",
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigation.pop(context);
              },
              child: Text("Play again!"),
            ),
          ],
        );
      },
    );
  }

  void clearBoard() {
    setState(() {
      cellValues = List.filled(cellValues.length, "");
      turns = false;
    });
  }

  String? findWinner() {
    for (final pattern in _winPatterns) {
      final [a, b, c] = pattern;
      if (cellValues[a].isNotEmpty &&
          cellValues[a] == cellValues[b] &&
          cellValues[a] == cellValues[c]) {
        return cellValues[a];
      }
    }
    return null;
  }

  void handleTap(int index) {
    setState(() {
      final v = cellValues[index];
      if (v == "") {
        cellValues[index] = turns ? O : X;
        turns = !turns;
      }
    });
    final winner = findWinner();
    if (winner != null) {
      showWinDialog(winner);
      clearBoard();
    } else if (!cellValues.contains("")) {
      showWinDialog("Draw");
      clearBoard();
    }
  }
}
