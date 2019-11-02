
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testt/ecom_model/categorie.dart';
import 'package:testt/ecom_model/ecom_model.dart';
import 'package:testt/ecommerce_ui/ProduitPage.dart';
import 'package:testt/mdels2/services_student.dart';

class CategoriePage extends StatefulWidget {
  @override
  _CategoriePageState createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  List<BottomNavigationBarItem> pages = [
    BottomNavigationBarItem(icon:Icon(Icons.home,color: Colors.grey,), title: Text('Home', style:TextStyle(color: Colors.grey) ,)),
    BottomNavigationBarItem(icon:Icon(Icons.shop, color: Colors.blue,), title: Text('Brand',style:TextStyle(color: Colors.blue))),
    BottomNavigationBarItem(icon:Icon(Icons.shopping_cart), title: Text('Cart')),
    BottomNavigationBarItem(icon:Icon(Icons.person), title: Text('Acount')),
  ];

  List<Categorie> cats;

  List<Categorie> _searchResult = [];



  Future getCategorie()async{
    List res =await LoadCursus();
    setState(() {
      if (res != null)
        cats = res;
    });
    return cats;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategorie();
  }

  TextEditingController textEditingController = TextEditingController();


  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    cats.forEach((cateD) {
      if (cateD.nom.contains(text))
        _searchResult.add(cateD);
    });

    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

        centerTitle: false,
        title: Text('Category Brand',style: TextStyle(color: Colors.blueGrey, fontSize: 22, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            width: 100,
            child: TextField(
              controller: textEditingController,
              onChanged: onSearchTextChanged,
              decoration: InputDecoration(
                hintText: "Search",
                  border: InputBorder.none
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: pages,
      ),
      body:(cats != null)? SafeArea(
          child: (_searchResult.length != 0 || textEditingController.text.isNotEmpty)?
          ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (context, i){
                return  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ProduitPage(_searchResult[i]);
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                      height: 150,
                      width: MediaQuery.of(context).size.width *0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: ExactAssetImage(_searchResult[i].image))
                      ),
                      child: Center(
                        child: Text(_searchResult[i].nom,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                    )
                );
              })
              :
          ListView.builder(
              itemCount: cats.length,
              itemBuilder: (context, i){
                return  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ProduitPage(cats[i]);
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                      height: 150,
                      width: MediaQuery.of(context).size.width *0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: ExactAssetImage(cats[i].image))
                      ),
                      child: Center(
                        child: Text(cats[i].nom,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                    )
                );
              }),
      )
          : CircularProgressIndicator()
    );
  }
}


