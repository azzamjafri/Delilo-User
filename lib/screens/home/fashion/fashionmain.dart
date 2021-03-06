import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/auxillary/drawer.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class FashionMainPage extends StatefulWidget {
  @override
  _FashionMainPageState createState() => _FashionMainPageState();
}

class _FashionMainPageState extends State<FashionMainPage> {
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    int _index = 0;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        body: Center(
          child: Container(
            width: width,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 18.0, 0, 18),
                  child: Row(
                    children: [
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Image.asset('assets/u.png'),
                        );
                      }),
                      Spacer(),
                      Container(
                        width: width * .75,
                        height: 46.0,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            // key: __passwordkey,
                            enableInteractiveSelection: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 4),
                                    borderRadius: BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Icon(
                                    Icons.search,
                                    size: 35,
                                    color: Colors.green.withOpacity(.75),
                                  ),
                                ),
                                hintText: "Search for Products, Shops"),
                            // validator: (value){},
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 15.0)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 12.0, 0.0, 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( "Fashion", style: TextStyle(fontSize: 20, color: Colors.green),),
                      Container(
                        width: 46.0,
                        child: Divider(thickness: 3.8, color: Colors.black,)),
                    ],
                  )
                ),
                Container(
                  width: width,
                  
                  height: 270,
                  child: StreamBuilder(
                    stream: Firestore.instance.collection('fashion').document('main_page').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Center(child: Text('Oops ! An error occured'));
                      else {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Loading Data ....',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic)),
                                Padding(padding: EdgeInsets.only(top: 2.0)),
                                CircularProgressIndicator(),
                              ],
                            ));
                            break;

                          default:
                            // print('page builder .....\n');
                            // print(snapshot.data['ref'].toString());
                            if (snapshot.hasData == false)
                              return Center(child: Text('No Items :)'));
                            else {
                              return PageView.builder(
                                itemCount: 5,
                                controller: PageController(viewportFraction: 0.6),
                                // onPageChanged: (int index) =>setState(() => _index = index),
                                onPageChanged: (index) => _index = index,
                                itemBuilder: (_, i) {
                                  return FutureBuilder(
                                    future: Firestore.instance.document(snapshot.data['ref'][i]).get(),
                                    builder: (context, shot) {
                                      switch (shot.connectionState) {
                                        case ConnectionState.waiting:
                                          return Center(child: new Text('Fetching....', style: TextStyle(fontStyle: FontStyle.italic)));
                                        default:
                                          if (shot.hasError)
                                            return new Text('Error: ${shot.error}');
                                          else {
                                            return Transform.scale(
                                              scale: i == _index ? 1 : 0.9,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context, '/productsdetail', arguments: shot.data);
                                                },
                                                child: Card(
                                                  elevation: 6,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)),
                                                  child: Stack(
                                                    children: [

                                                     
                                                      Positioned(
                                                        top: 1.0,
                                                        bottom: 0.1,
                                                        child: FractionallySizedBox(
                                                        alignment: Alignment.bottomCenter,
                                                        heightFactor: .4,
                                                        child: Container(
                                                          width: width / 2 + 30.0,
                                                          decoration: BoxDecoration(
                                                              color: Colors.lightGreen.shade500,
                                                              borderRadius: BorderRadius.only(
                                                              
                                                                  bottomLeft: Radius.circular(20),
                                                                  bottomRight: Radius.circular(20))),
                                                          
                                                          child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 3.0, 4.0),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text('${shot.data['name']}', style: TextStyle(color: Colors.white)),
                                                                Center(child: Text('${shot.data['shop_name']}', style: TextStyle(color: Colors.white))),
                                                                Text('₹ ${shot.data['price']}', style: TextStyle(color: Colors.white)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ),
                                                      ),

                                                       ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors.grey.withOpacity(0.5),
                                                                spreadRadius: 10,
                                                                blurRadius: 7,
                                                                offset: Offset(3, 3), // changes position of shadow
                                                              ),
                                                            ],
                                                          ),
                                                          height: 170.0,
                                                          width: width / 2 + 45.0,
                                                          child: Image.asset('assets/Image 5.png', fit: BoxFit.fill,)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                      }
                                    },
                                  );
                                },
                              );
                            }
                          // Firestore.instance.collection(snapshot.data['ref'][0]).document();

                        }
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "For",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/mensfashion');
                      },
                      child: Container(
                        height: 130,
                        width: 120,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            
                            decoration: BoxDecoration(
                              
                                image: DecorationImage(
                                  
                              image: AssetImage('assets/i.png'),
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            )),
                            child: Center(
                              child: Text("Men",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/womenfashion');
                      },
                      child: Container(
                        height: 130,
                        width: 120,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/3.png'),
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            )),
                            /* decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage())
                                ),*/
                            child: Center(
                              child: Text("Women",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/kidsfashion');
                      },
                      child: Container(
                        height: 130,
                        width: 120,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/6.png'),
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            )),
                            /* decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage())
                                ),*/
                            child: Center(
                              child: Text("Kids",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child:  Container(
                  width: width,
                  height: height,
                  child: StreamBuilder(
                    stream: Firestore.instance.collection('fashion').document('main_page').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Center(child: Text('Oops ! An error occured'));
                      else {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Loading Data ....',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic)),
                                Padding(padding: EdgeInsets.only(top: 2.0)),
                                CircularProgressIndicator(),
                              ],
                            ));
                            break;

                          default:
                            // print('page builder .....\n');
                            // print(snapshot.data['ref'].toString());
                            if (snapshot.hasData == false)
                              return Center(child: Text('No Items :)'));
                            else {
                              int count = snapshot.data['ref'].length;
                              return GridView.builder(
                                itemCount: count,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                // controller: PageController(viewportFraction: 0.6),
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (_, i) {

                                  return FutureBuilder(
                                    future: Firestore.instance.document(snapshot.data['ref'][i]).get(),
                                    builder: (context, shot) {
                                      switch (shot.connectionState) {
                                        case ConnectionState.waiting:
                                          return Center(child: new Text('Fetching....', style: TextStyle(fontStyle: FontStyle.italic)));
                                        default:
                                          if (shot.hasError)
                                            return new Text(
                                                'Error: ${shot.error}');
                                          else {
                                            return GestureDetector(
                                              onTap: () {
                                                
                                                Navigator.pushNamed(context,'/productsdetail',arguments: shot.data);
                                              },
                                              child: Stack(
                                                children: [
                                                  Card(
                                                elevation: 6,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                  child: Image.asset('assets/Image 5.png'))
                                              ),
                                              Positioned(
                                                top: 1.0,
                                                bottom: 1.0,
                                                child: FractionallySizedBox(
                                                    alignment: Alignment.bottomCenter,
                                                    heightFactor: .4,
                                                    
                                                    child: Container(
                                                      width: width / 2 - 2,
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                                          ),
                                                      // child: Center(child: Text("${shot.data['name']}")),
                                                      child: Padding(
                                                        padding: const EdgeInsets.fromLTRB(8.0, 3.0, 3.0, 4.0),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text('${shot.data['name']}', style: TextStyle(color: Colors.white)),
                                                            Center(child: Text('${shot.data['shop_name']}', style: TextStyle(color: Colors.white))),
                                                            Text('₹ ${shot.data['price']}', style: TextStyle(color: Colors.white)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ),
                                                ],
                                              )
                                            );
                                          }
                                      }
                                    },
                                  );
                                },
                              );
                            }
                          // Firestore.instance.collection(snapshot.data['ref'][0]).document();

                        }
                      }
                    },
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
Card(
semanticContainer: true,
clipBehavior: Clip.antiAliasWithSaveLayer,
child: Container(
height: 200,
width: width*.22,
child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .3,child: Container(color: Colors.white,child: Center(child: Text("Some Description")),),),
decoration: BoxDecoration(
image: DecorationImage(
colorFilter: ColorFilter.mode(Colors.black87.withOpacity(.2), BlendMode.darken),
image: AssetImage('assets/fashion1.jpg'),

fit: BoxFit.fitHeight,
alignment: Alignment.topCenter,
),
),
),


shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10.0),
),
elevation: 5,
margin: EdgeInsets.all(10),
),*/
