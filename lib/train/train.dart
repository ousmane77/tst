import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:testt/train/providers/provider_train.dart';

class Train extends StatefulWidget {

  @override
  _TrainState createState() => _TrainState();
}

class _TrainState extends State<Train> {
  TextEditingController _textEditingController = TextEditingController();

  TextEditingController _textEditingController1 = TextEditingController();

  List<int> taill = [1, 2,3, 4];

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);


  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {


    final con = Provider.of<Train1>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          con.wagons.clear();
        });
      },
        child: Icon(Icons.delete),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 500,
              color: Colors.orange,
              width: MediaQuery.of(context).size.width,
              child: Consumer<Train1>(
                builder: (ctx, cont, _){
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade200,
                              shape: BoxShape.circle
                            ),
                          ),
                        ],
                      ),
                      ...cont.wagons.map((f){
                        return Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              height:f.height,
                              width: f.width,
                              color: f.color,
                            ),
                          ],
                        );
                      }).toList()
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 250,
              width: double.infinity,
              color: Colors.orange,
              child: Column(
                children: <Widget>[
                  Text("Infos Wagon", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      labelText: "Hauteur"
                    ),
                  ),
                  TextField(
                    controller: _textEditingController1,
                    decoration: InputDecoration(
                        labelText: "Largeur"
                    ),
                  ),
                  RaisedButton(onPressed: (){
                    showDialog(
                      context: context,
                      child: AlertDialog(
                        title: const Text('Pick a color!'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: pickerColor,
                            onColorChanged: changeColor,
                            enableLabel: true,
                            pickerAreaHeightPercent: 0.8,
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text('Got it'),
                            onPressed: () {
                              setState(() => currentColor = pickerColor);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                    child: Text("Choisir couleur"),
                  ),
                  RaisedButton(onPressed: (){
                    con.addW(double.parse(_textEditingController.text), double.parse(_textEditingController1.text), currentColor);
                  },
                    child: Text("Generer"),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }


}
