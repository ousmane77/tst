import 'package:flutter/material.dart';
import 'package:testt/ecom_model/ecom_model.dart';

class Chart extends StatefulWidget {
  final Produit produit;

  Chart(this.produit);
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  int number = 1;
  int total = 0;
  bool activated = false;

  void push() {

  }

  @override
  void initState() {
    super.initState();
    setState(() {
      total = widget.produit.prix;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (number > 0)
      activated = true;

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Chart', style: TextStyle(color: Colors.black)),
        ),
        body: Column(
          children: <Widget>[
            Card(
              elevation: 3,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Image.asset(
                              widget.produit.image,
                              fit: BoxFit.cover,
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 15),
                                  Text("${widget.produit.nom}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 15),
                                  Text('Internal 1 TB',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18)),
                                  SizedBox(height: 15),
                                  Text('\$ ${widget.produit.prix}',
                                      style: TextStyle(fontSize: 20)),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (number > 0)
                                              number--;
                                              total = number * widget.produit.prix;
                                              activated =false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 40,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1)
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 80,
                                          child: Text(
                                            number.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            number++;
                                            total = number * widget.produit.prix;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 40,
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1)),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  Divider(
                    height: 5,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Total : \$ $total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        MaterialButton(
                          disabledColor: Colors.blue.withOpacity(0.6),
                          disabledTextColor: Colors.white,
                          height: 40,
                          minWidth: 120,
                          textColor: Colors.white,
                          onPressed: (activated) ? push : null,
                          child: Text('Pay'),
                          color: Colors.blue,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(color: Colors.blue),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            showUnselectedLabels: true,
            currentIndex: 2,
            onTap: (i) {},
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shop), title: Text('Brand')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), title: Text('Cart')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Account')),
            ]),
      ),
    );
  }
}

