import 'package:flutter/material.dart';

class GameButton {
  String text; // X or O or nothing
  final id; //refrence
  Color bg; //green or teal or grey
  bool enabled; //if the button pressed

  GameButton(
      {this.text = "", this.id, this.bg = Colors.grey, this.enabled = true});
}
