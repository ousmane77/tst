import 'package:flutter/material.dart';



class Drapeau with ChangeNotifier{

  Color caughtColor = Colors.grey;
  bool myS = false;

  List<Color> tabcolor = [
    Colors.orange,
    Colors.white,
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.blueAccent
  ];
  List<Color> stateColor = [
  ];
  List<List<double>> tailles = [
    [200.0, 300.0],
    [150.0, 200.0],
    [100.0, 100.0]
  ];


}