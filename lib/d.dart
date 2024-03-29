import 'package:flutter/material.dart';



class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: <Widget>[

            DragBox(Offset(0.0, 0.0), 'Box One', Colors.blueAccent),
            DragBox(Offset(200.0, 0.0), 'Box Two', Colors.orange),
            DragBox(Offset(300.0, 0.0), 'Box Three', Colors.lightGreen),
            DragBox(Offset(300.0, 0.0), 'Box ', Colors.orange),
            Positioned(
              left: 100.0,
              bottom: 0.0,
              child: DragTarget(
                onAccept: (Color color) {
                  caughtColor = color;
                },
                builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                    ) {
                  return Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Text("Drag Here!"),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  DragBox(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.itemColor,
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(
            width: 120.0,
            height: 120.0,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ));
  }
}

/*Stack(
alignment: Alignment.center,
children: <Widget>[
con(200.0, 300.0, Colors.pink),
con(150.0, 200.0, Colors.blueAccent),
con(100.0, 100.0, Colors.grey),
],
)







Row(
mainAxisAlignment: MainAxisAlignment.center,
children: (stateColor.length > 0) ? stateRow() : <Widget>[],)
*/