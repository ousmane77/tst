import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'providers/IconD.dart';

class BottomA extends StatefulWidget {
  @override
  _BottomAState createState() => _BottomAState();
}

class _BottomAState extends State<BottomA> {
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color color4 = Colors.white;
  Color black = Colors.white;
  bool app = false;
  int curr = 0;
  List<Map<String, dynamic>> lisIcon = [
    {
      "nom": Icons.add,
      "des": "Ajouter",
    },
    {
      "nom": Icons.home,
      "des": "Ajouter",
    },
    {
      "nom": Icons.favorite_border,
      "des": "Ajouter",
    },
    {
      "nom": Icons.perm_media,
      "des": "Ajouter",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Bottom"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.blue,
          child: Center(
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: lisIcon.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(lisIcon[i]["nom"]),
                            iconSize: 30,
                            onPressed: () {
                              select(i);
                            },
                            color: getColor(i),
                          ),
                          Text(
                            lisIcon[i]["des"],
                            style: TextStyle(color: getColor(i)),
                          )
                        ],
                      ),
                    );
                  })),
        ),
      ),
    );
  }

  Color getColor(int ListIndex) {
    return (curr == ListIndex) ? Colors.red : Colors.white;
  }

  void select(int Lindex) {
    setState(() {
      curr = Lindex;
    });
  }
}

class Bottom2 extends StatefulWidget {
  @override
  _Bottom2State createState() => _Bottom2State();
}

class _Bottom2State extends State<Bottom2> {
  List<CostumIcon> list = [
    CostumIcon(nom: "Media", iconData: Icons.perm_media, selected: true),
    CostumIcon(nom: "ajouter", iconData: Icons.add, selected: false),
    CostumIcon(nom: "Message", iconData: Icons.message, selected: false),
    CostumIcon(nom: "Home", iconData: Icons.home, selected: false),
  ];

  Color getColor(CostumIcon data) {
    return (data.selected) ? Colors.red.shade300 : Colors.grey;
  }

  void active(CostumIcon data) {
    setState(() {
      list.forEach((icon) => icon.selected = false);
      list[list.indexOf(data)].selected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<CustomIconss>(builder: (ctx, curr, _) {
        return BottomAppBar(
            child: Container(
          height: 70,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Center(
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: curr.list.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(list[i].iconData),
                            iconSize: 30,
                            onPressed: () {
                              curr.change(i);
                            },
                            color: (curr.currentIndex == i)
                                ? Colors.red
                                : Colors.grey,
                          ),
                          Text(
                            list[i].nom,
                            style: TextStyle(color: (curr.currentIndex == i)
                                ? Colors.red
                                : Colors.grey,),
                          )
                        ],
                      ),
                    );
                  })),
        ));
      }),
    );
  }
}
