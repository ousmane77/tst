import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class CostumIcon {
  final String nom;
  final IconData iconData;
  bool selected = false;

  CostumIcon(
      {
        @required this.nom,
        @required this.iconData,
        this.selected
      }
      );


}

class CustomIconss with ChangeNotifier{
  int _currentIndex = 0;
  List<CostumIcon> list = [
    CostumIcon(nom: "Media", iconData: Icons.perm_media, selected: true),
    CostumIcon(nom: "ajouter", iconData: Icons.add, selected: false),
    CostumIcon(nom: "Message", iconData: Icons.message, selected: false),
    CostumIcon(nom: "Home", iconData: Icons.home, selected: false),
  ];

  get currentIndex => _currentIndex;

  void change(int i){
    _currentIndex = i;
    notifyListeners();
  }

}