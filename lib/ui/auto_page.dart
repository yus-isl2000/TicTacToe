import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/model/custom_dailog.dart';
import 'package:tictactoe/model/game_button.dart';

class AutoPage extends StatefulWidget {
  @override
  _AutoPageState createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> {
  List<GameButton> buttonsList;
  var player1;
  var player2;
  var currentplayer;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = List();
    player2 = List();
    currentplayer = 1;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (currentplayer == 1) {
        gb.text = 'X';
        gb.bg = Colors.green;
        currentplayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = 'O';
        gb.bg = Colors.teal;
        currentplayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => new CustomDialog("Game Tied",
                  "Press the reset button to start again.", resetGame));
        } else {
          currentplayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = new List();
    var list = new List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = new Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellID);
    playGame(buttonsList[i]);
  }

  int checkWinner() {
    int winner = -1;
    /**
     * Rows
     *  1, 2, 3 DONE
     *  4, 5, 6 DONE
     *  7, 8, 9 DONE
     */
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
      debugPrint('Winner is Player 1');
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
      debugPrint('Winner is Player 2');
    }
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    /**
     * Columns
     *  1, 4, 7
     *  2, 5, 8
     *  3, 6, 9
     */
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    /**
     * Diagonal
     *  1, 5, 9
     *  3, 5, 7
     */
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                  'Player 1 Won!',
                  'Press the reset Button to play again!',
                  resetGame,
                ));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                  'Player 2 Won!',
                  'Press the reset Button to play again!',
                  resetGame,
                ));
      }
    }
    return winner;
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tic Tac Toe'),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9,
          ),
          itemBuilder: (context, i) => SizedBox(
            width: 100,
            height: 100,
            child: RaisedButton(
              onPressed: buttonsList[i].enabled
                  ? () => playGame(buttonsList[i])
                  : null,
              padding: EdgeInsets.all(8.0),
              child: Text(
                buttonsList[i].text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: buttonsList[i].bg,
              disabledColor: buttonsList[i].bg,
            ),
          ),
          itemCount: buttonsList.length,
        ));
  }
}
