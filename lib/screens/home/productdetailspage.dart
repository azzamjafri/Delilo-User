import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class ProductDetailPage extends StatefulWidget {
  
  DocumentSnapshot document;

  ProductDetailPage(var t) {
    document = t;
  }

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _opacity1 = 0;
  double _opacity2 = 0;
  double _opacity3 = 0;
  double _opacity4 = 0;
  changeopacity(double opacity) {
    if (opacity == 0)
      opacity = 1;
    else
      opacity = 0;
    return opacity;
  }

  int _index = 0;

  final key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // Firestore.instance.collection('fashion').document().collection('reviews').getDocuments()

    double height = displayHeight(context);
    double width = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        key: key,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ))),
        ),
        body: Center(
          child: Container(
            child: ListView(
              children: [
                Container(
                  width: width,
                  height: 350,
                  child: PageView.builder(
                    itemCount: 4,
                    controller: PageController(viewportFraction: 1),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            /* decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage())
                          ),*/
                            child: Center(
                              child: Image.asset('assets/productdetails.png'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  //alignment: Alignment(.6,-1),
                  child: Text(
                    "${widget.document['name']}",
                    style: TextStyle(color: Colors.green, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${widget.document['shop_name']}",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          Container(
                            width: 250,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 19.0),
                                  child: Text(
                                    "₹ ${widget.document['price']}",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green,
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 30,
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _opacity1 = changeopacity(_opacity1);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Opacity(
                              opacity: _opacity1,
                              child: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _opacity2 = changeopacity(_opacity2);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Opacity(
                              opacity: _opacity2,
                              child: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _opacity3 = changeopacity(_opacity3);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Opacity(
                              opacity: _opacity3,
                              child: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _opacity4 = changeopacity(_opacity4);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Opacity(
                              opacity: _opacity4,
                              child: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque non felis sem. Vestibulum tincidunt varius velit in facilisis. Ut eu nunc at libero placerat hendrerit. Morbi quis ornare dui. Cras at sapien a velit pretium accumsan eget in ex. Quisque ac odio tristique, semper mauris eu, posuere metus",style: TextStyle(fontSize: 17),),
                Text(
                  "${widget.document['description']}",
                  style: TextStyle(fontSize: 17),
                ),
                Center(
                    child: Text(
                  "\nReviews",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                )),
                StreamBuilder(
                    stream: Firestore.instance
                        .collection(widget.document.reference.path + '/reviews')
                        .snapshots(),
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
                                Text('Fetching Data ....',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic)),
                                Padding(padding: EdgeInsets.only(top: 2.0)),
                                CircularProgressIndicator(),
                              ],
                            ));
                            break;

                          default:
                          if(snapshot.data.documents.length == 0) return Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
                                
                                child: Center(child: Text('No Reviews for this product :)', style: TextStyle(fontStyle: FontStyle.italic))),
                              );
                           
                             
                            else {
                              
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (_, index) {
                                  var data = snapshot.data.documents[index];
                                  return new Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Container(
                                      height: 300,
                                      //color: Colors.redAccent.withOpacity(.6),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.person_pin,
                                                    size: 50,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text("${data['name']}",style: TextStyle(fontSize: 20),),
                                                      Row(
                                                        children: [
                                                          for(int i=1; i <= int.parse(data['ratings']); i++) Icon(Icons.star, color: Colors.yellow,),
                                                          for(int i=1; i <= 5 - int.parse(data['ratings']); i++) Icon(Icons.star_border, color: Colors.yellow,),
                                                          // Icon(Icons.star, color: Colors.yellow,),
                                                          // Icon(Icons.star_border, color: Colors.yellow,),
                                                          
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque non felis sem. Vestibulum tincidunt varius velit in facilisis. Ut eu nunc at libero placerat hendrerit. Morbi quis ornare dui. Cras at sapien a velit pretium accumsan eget in ex. Quisque ac odio tristique, semper mauris eu, posuere metus",style: TextStyle(fontSize: 17),),
                                          Text("${data['review']}", style: TextStyle(fontSize: 17),),
                                        ],
                                      ),
                                      //child: Center(child: Text("Stay Indoors Stay safe \n Consult Online Now",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.all(10),
                                  );
                                },
                              );
                            }
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: BottomNavigationBar(
            //backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 50,
                        width: width * .8,
                        child: FlatButton(
                            onPressed: () async {
                              // print(widget.document.reference.path);
                              bool add = true;
                              await Firestore.instance.collection('users').document(user.uid).get().then((value) => {
                                value.data['cart'].forEach((element) {
                                  if(element == widget.document.reference.path) {
                                    add = false;
                                    
                                  }
                                })
                              });
                              if(add){
                                Firestore.instance.collection('users').document(user.uid).updateData({
                                'cart': FieldValue.arrayUnion([widget.document.reference.path]),
                              });
                              }else{
                                key.currentState.showSnackBar(SnackBar(content: Text('Item Already Present in the Cart !'),));
                              }
                              
                            },
                            child: Text("Add To Cart", style: TextStyle(color: Colors.green, fontSize: 15),)
                            )
                          )
                        ),
                title: Container(),
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            height: 50,
                            width: width * .8,
                            child: FlatButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/cart');
                                },
                                child: Text(
                                  "Pay Now",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ))))),
                title: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
