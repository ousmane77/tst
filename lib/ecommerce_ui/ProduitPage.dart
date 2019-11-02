
import 'package:flutter/material.dart';
import 'package:testt/ecom_model/ecom_model.dart';
import 'package:testt/ecommerce_ui/chart.dart';


class ProduitPage extends StatefulWidget {

  final Categorie categorie;

  ProduitPage(this.categorie);


  @override
  _ProduitPageState createState() => _ProduitPageState();
}

class _ProduitPageState extends State<ProduitPage> {

  List<Produit> _searchResult = [];

  TextEditingController textEditingController = TextEditingController();


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.categorie.nom,
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.black)),
        actions: <Widget>[
          Container(
            width: 100,
            child: TextField(
              controller: textEditingController,
              onChanged: (String text) async {
            _searchResult.clear();
            if (text.isEmpty) {
            setState(() {});
            return;
            }
            widget.categorie.listProduits.listProduit.forEach((f) {
            if (f.nom.contains(text))
            _searchResult.add(f);
            });

            setState(() {});
            },
              decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none
              ),
            ),
          )
        ],
      ),


      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Card(
                    elevation: 3,
                    child: Container(
                      height: 50,
                      //width: MediaQuery.of(context).size.width/2.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.arrow_drop_down),
                          Text('sort'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 3,
                    child: Container(
                      height: 50,
                      //width: MediaQuery.of(context).size.width/2.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.arrow_drop_down),
                          Text('Refine'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            _searchResult.length > 0 || textEditingController.text.isNotEmpty?
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 2/3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemCount: _searchResult.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Chart(_searchResult[i]);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            _searchResult[i].image,
                            fit: BoxFit.cover,
                            height: 150,
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("${_searchResult[i].nom}", style:TextStyle(color: Colors.grey)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("${_searchResult[i].prix}", style:TextStyle(color: Colors.black)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text('4.5',style:TextStyle(color: Colors.grey)),
                                      Icon(Icons.star, color:Colors.yellow),
                                      Spacer(),
                                      Text("200 Sale",style:TextStyle(color: Colors.grey)),
                                      SizedBox(width: 6,),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                },
              ),
            )
                :
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 2/3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget.categorie.listProduits.listProduit.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Chart(widget.categorie.listProduits.listProduit[i]);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            widget.categorie.listProduits.listProduit[i].image,
                            fit: BoxFit.cover,
                            height: 150,
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("${widget.categorie.listProduits.listProduit[i].nom}", style:TextStyle(color: Colors.grey)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("${widget.categorie.listProduits.listProduit[i].prix}", style:TextStyle(color: Colors.black)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text('4.5',style:TextStyle(color: Colors.grey)),
                                      Icon(Icons.star, color:Colors.yellow),
                                      Spacer(),
                                      Text("200 Sale",style:TextStyle(color: Colors.grey)),
                                      SizedBox(width: 6,),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }

}


