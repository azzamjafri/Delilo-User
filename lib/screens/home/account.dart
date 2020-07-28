import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';


class AccountInfo extends StatefulWidget {
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("My Account",style: TextStyle(color: Colors.white,fontSize: 20),),
        centerTitle: true,
        actions: [Icon(Icons.notifications,color: Colors.white,)],

      ),
      body: Center(
        child: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Container(
                  height: 300,
                  width: width*.9,
                  //color: Colors.redAccent.withOpacity(.6),
                  //child: Center(child: Text("Stay Indoors Stay safe \n Consult Online Now",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      CircleAvatar(backgroundColor: Colors.transparent,child: Image.asset("assets/profileI.png")),
                      Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 30,width:width*.2,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/homescreen');}, child: Text("Change",style: TextStyle(color: Colors.white,fontSize: 10),))),
                      Padding(
                        padding: const EdgeInsets.only(right:38.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Brianna Hansen"),
                            Text("+91-11111111"),
                            Text("Bhansen@gmail.com"),
                          ],
                        ),
                      )


                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Address",style: TextStyle(color: Colors.green,fontSize: 25),),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Container(
                  height: 180,
                  width: width*.9,
                  //color: Colors.redAccent.withOpacity(.6),
                  //child: Center(child: Text("Stay Indoors Stay safe \n Consult Online Now",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [


                     // CircleAvatar(backgroundColor: Colors.transparent,child: Image.asset("assets/profileI.png")),
                      //Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 30,width:width*.2,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/homescreen');}, child: Text("Change",style: TextStyle(color: Colors.white,fontSize: 12),))),
                      Padding(
                        padding: const EdgeInsets.only(right:38.0),
                        child: Text("Lorem ipsum.......\n..........\n.....\nLong Address \n\nhere"),

                      )


                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: getBottomNavBar(),
    );
    
  }


  getBottomNavBar() {
    return  BottomNavigationBar(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              
              icon: Container(
                height: 50,
                  width: 50,
                  
                  // child: Icon(Icons.home,color: Colors.green,)
                  child: IconButton(icon: Icon(Icons.home, color: Colors.white), onPressed: () {
                    Navigator.pushReplacementNamed(context, '/homescreen');
                  }),
                  ),
              title: Container(),

            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/cart');
                  // Navigator.pushNamed(context, '/cart');
                  },
                child: Container(
                    height: 50,
                    width: 50,
                    /*decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),*/
                    child: Icon(Icons.shopping_cart,color: Colors.white,)),
              ),
              title: Container(),

            ),
            BottomNavigationBarItem(
              icon: Container(
                  height: 50,
                  width: 50,
                 decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Icon(Icons.person,color: Colors.green,)),
              title: Container(),

            ),
          ],
        );
  }
}
