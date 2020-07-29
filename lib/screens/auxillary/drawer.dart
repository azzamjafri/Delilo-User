import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/auth_service.dart';
import 'package:flutter/material.dart';



class MyDrawer extends StatefulWidget {

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String name;
  @override
  void initState() {
    super.initState();
    Firestore.instance.collection('users').document(user.uid).get().then((value) {
      setState(() => name = value.data['username']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Colors.green,
            child: DrawerHeader(
              child: Center(
              child: Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Align(alignment: Alignment(-1,-1),child: Icon(Icons.close, color: Colors.white,)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35,0,0,0),
                      child: Center(
                        //alignment: Alignment(1,1),
                        child: Row(
                          children: [
                            // Icon(Icons.person_pin,size: 70,),
                            Container(
                              height: 75.0,
                              width: 75.0,
                              child: Image.asset('assets/ok.png', color: Colors.black,)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("$name", style: TextStyle(color: Colors.white),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10,15,0,0),
                                  child: Text("Gold Member", style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/rateus');
                      },
                                          child: Padding(
                        padding: const EdgeInsets.only(top:18.0),
                        child: Align(alignment: Alignment(1,1),child: Text("Rate Us", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, decorationThickness: 1.5),)),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/');
              },
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35.0),
                      child: Image.asset('assets/Icon awesome-mobile-alt.png'),
                    ),
                    
                    Text(
                      "Mobiles",
                      style: TextStyle(
                        //fontSize: 15,
                          color: Colors.green),
                    ),
                    Spacer(),Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/fashionmain');
              },
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  
                  children: [
                    Image.asset('assets/Group 418.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Fashion",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/lamp.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Household",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Group 419.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Beauty And Health",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Group 424.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Toys & Baby Products",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Group 420.png'),

                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Nearby Markets",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Group 421.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Dairy Products",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Group 422.png'),

                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Sport & More",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Group 423.png'),

                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Party & Gatherings",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Icon material-card-travel.png'),

                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Travel & Explore",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/orders');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Group 408.png'),

                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        "Orders",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/orders');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Icon material-history.png'),    

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "History",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/coupons');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/%.png'),

                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        "Coupons",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/sellersignin');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Icon ionic-ios-person-add.png'),

                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Be A Seller",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/customersupport');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Shape.png'),

                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Customer Support",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),





        ],
      ),
    );
  }
}

