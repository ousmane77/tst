import 'package:flutter/material.dart';

class Train1 with ChangeNotifier{
   Tete tete;
   List<Wagon> wagons = [

   ];

   get listW => [...wagons];

  void addW(double _height, double _with, Color color){
    wagons.add(Wagon(_height, _with,color));
    notifyListeners();
  }
}



class Tete{
  final double height;
  final double width;
  final Color color;

  Tete(this.height, this.width, this.color);

  Widget tete(){
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange.shade200
      ),
    );
  }


}


class Wagon{
  final double height;
  final double width;
  final Color color;

  Wagon(this.height, this.width, this.color);

  Widget wagon(double _height, double _width, Color _color){
    return Container(
      height: _height,
      width: _width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _color
      ),
    );
  }

}