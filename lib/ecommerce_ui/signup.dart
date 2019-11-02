import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  List<Color> maListe = [
    Colors.deepPurple.shade900,
    Colors.deepPurple.shade700,
    Colors.deepPurple.shade500,
    Colors.deepPurple.shade300
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage('lib/woman-1320810_1920 copie.jpg'),fit: BoxFit.cover)
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 60,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 40,
                      ),

                      Positioned(
                        right: 2,
                        top: 6,
                        child: CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.indigo,
                          child: Icon(Icons.shopping_cart, color: Colors.white, size: 30,),
                        ),
                      )
                    ],
                  ),
                ),

                Text('Treva Shop', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)

              ],
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(icon: Icon(Icons.email,size: 25,),hintText: "Email",labelStyle: TextStyle(fontSize: 20),
                      border: InputBorder.none
                  ),
                ),
              ) ,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(icon: Icon(Icons.vpn_key,size: 25,),hintText: "Password",labelStyle: TextStyle(fontSize: 20),
                      border: InputBorder.none
                  ),
                ),
              ) ,
            ),
            SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Have Acount? ', style: TextStyle(color: Colors.white),),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "signin");
                    },
                    child: Text("Sign In", style: TextStyle(color: Colors.white)),
                  )
                ],
              )
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom:28.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                      Navigator.pushNamed(context, "categoriePage");
                  },
                  child: Container(
                    height: 60,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        gradient: LinearGradient(
                            colors: maListe,
                            begin:  Alignment.centerLeft,
                            end: Alignment.centerRight)
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Center(
                      child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 22),),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}
