import 'package:flutter/material.dart';
import 'package:tictactoe/ui/game_page.dart';

import 'auto_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
        centerTitle: true,
      ),
      //body
      body: Center(
        child: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/picture.png',
                  width: 250,
                  height: 280,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 40),
                child: Text(
                  'How do you want to play?',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AutoPage()))
                      },
                      child: Text('1-Player'),
                    ),
                    RaisedButton(
                        onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GamePage()))
                            },
                        child: Text('2-Player')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      //image asset that is different from our first image
      //text that says 'press start to begin
      //start raised button
    );
  }
}
