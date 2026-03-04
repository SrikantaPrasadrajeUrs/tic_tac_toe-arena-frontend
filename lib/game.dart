import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> cellValues = List.filled(9, "");
  bool turns = false;

  static const List<List<int>> _winPatterns = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,5,6],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: ()=>handleTap(index),
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

  String? showWinner(){
    for(final pattern in _winPatterns){
      final a = pattern[0];
      final b = pattern[1];
      final c = pattern[2];

      if(cellValues[a]!=""&&cellValues[a]==cellValues[b]&&cellValues[a]==cellValues[c]){
        return cellValues[a];
      }

    }

    return null;
  }

  void handleTap(int index) {
    setState(() {
      if (cellValues[index] == "") {
        cellValues[index] = turns ? "o" : "x";
        turns = !turns;
      }
    });
    final res = showWinner();
    print(res);
  }
}
