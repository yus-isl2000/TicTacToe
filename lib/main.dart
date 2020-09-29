import 'package:flutter/material.dart';
import 'package:tictactoe/ui/game_page.dart';
import 'package:tictactoe/ui/home_page.dart';

void main() {
  runApp(new MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
    title: 'Tic Tac Toe',
  ));
}
