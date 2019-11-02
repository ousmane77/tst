import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/bottom.dart';
import 'package:testt/drag.dart';
import 'package:testt/ecommerce_ui/HomePage.dart';
import 'package:testt/ecommerce_ui/ProduitPage.dart';
import 'package:testt/ecommerce_ui/categoriePage.dart';
import 'package:testt/providers/dragg.dart';
import 'package:testt/train/providers/provider_train.dart';

import 'package:testt/train/train.dart';
import 'ecommerce_ui/signup.dart';
import 'ecommerce_ui/signin.dart';
import 'providers/IconD.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CustomIconss()),
        ChangeNotifierProvider.value(value: Drapeau()),
        ChangeNotifierProvider.value(value: Train1()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,

          primarySwatch: Colors.blue,
        ),
        home: Train(),
        routes: {
          "signin": (context) => Signin(),
          "signup": (context)=> Signup(),
          "categoriePage": (context)=> CategoriePage(),
        },
      ),
    );
  }
}











class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color deff = Colors.black12;

  bool swi = false;

  List<Color> mesCouleur = [
    Colors.white,
    Colors.red,
    Colors.indigo,
    Colors.yellow,
    Colors.orange,
    Colors.green
  ];

  List<Color> stateColors = [];

  List<List<double>> tailles = [
    [400.0, 450.0],
    [300.0, 350.0],
    [200.0, 250.0],
  ];

  Map <String, List<Color>> maMap = {
    "Civ": [Colors.orange, Colors.white, Colors.green],
    "Fr": [Colors.blue, Colors.white, Colors.red],
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
        centerTitle: true,
        actions: <Widget>[
          Switch(
            activeColor: Colors.red,
              value: swi,
              onChanged: (bool b){
            setState(() {
              swi = b;
            });
          })
        ],
      ),
      backgroundColor: Colors.grey,

      body: Container(
        child: Column(
          children: <Widget>[

            Expanded(
                child: GridView.builder(

                  itemCount: mesCouleur.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (context, i){
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      child: Draggable<Color>(

                          data: mesCouleur[i],
                          child: Container(
                            height: 60,
                            width: 60,
                            color: mesCouleur[i],
                        ),
                          feedback:  Container(
                            height: 60,
                            width: 60,
                            color: mesCouleur[i],
                          )
                      ),
                    );
                    }),
                flex: 5
            ),

            Expanded(
              flex: 5,
              child: Container(
                color: Colors.black12,
                margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 80.0),
                child: DragTarget<Color>(
                    builder: (context, List<Color> accepted,refused){
                      return (swi) ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            height: 200.0,
                            color: deff,
                          ),
                          Container(
                            width: 100.0,
                            height: 200.0,
                            color: deff,
                          ),
                          Container(
                            width: 100.0,
                            height: 200.0,
                            color: deff,
                          ),
                        ],
                      ) : Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(width: 400, height: 350, color: deff,),
                          Container(width: 300, height: 200, color: Colors.white,),
                          Container(width: 200, height: 150, color: Colors.green,)
                        ],
                      );


                        Container(
                        color: deff,
                      );
                },
                  onWillAccept: (d){
                      return true;
                  },
                  onAccept: (dataa){
                      setState(() {
                          deff = dataa;
                      });
                  },
                ),
              ),
            )



          ],
        ),

      ),


    );
  }
}
