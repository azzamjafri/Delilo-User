import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}
// double total;

ValueNotifier<double> total = ValueNotifier(0.0);

class _CartPageState extends State<CartPage> {

  @override
  void initState() {
    super.initState();
    // setState(() => total = 0.0);
    total.value = 0.0;
    
  }

  
  
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.green,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "My Cart",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          children: [

            Container(
            height: height + width * .34,
            child: StreamBuilder(
                stream: Firestore.instance.collection('users').document(user.uid).snapshots(),
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
                                style: TextStyle(fontStyle: FontStyle.italic)),
                            Padding(padding: EdgeInsets.only(top: 2.0)),
                            CircularProgressIndicator(),
                          ],
                        ));
                        break;

                      default:
                        
                        if (snapshot.hasData == false)
                          return Center(child: Text('No Items In Cart :)'));
                        else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            // scrollDirection: Axis.vertical,
                            itemCount: snapshot.data['cart'].length,
                            itemBuilder: (_, index) {
                              return FutureBuilder(
                                
                                future: Firestore.instance.document(snapshot.data['cart'][index]).get(),
                                builder: (context, snap) {
                                  switch(snap.connectionState) {
                                    case ConnectionState.waiting:
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(child: new Text('Fetching Products...', style: TextStyle(fontStyle: FontStyle.italic))),
                                      );
                                    default:
                                      if (snap.hasError)
                                            return new Text('Error: ${snap.error}');
                                      else{

                                        total.value += double.parse(snap.data['price']);
                                        return ProductCard(
                                          productqty: 1,
                                          price: snap.data['price'],
                                          name: snap.data['name'],
                                          imageurl: "dd",
                                          shopName: snap.data['shop_name'],
                                        );
                                      }
                                  }
                                },
                              );
                            },
                          );
                        }
                    }
                  }
                }),
          ),
          ],
                  
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: width * .95,
            height: width * .34,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Divider(
                  color: Colors.red.withBlue(2),
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Your Order"),
                    ValueListenableBuilder(
                      valueListenable: total,
                      builder: (context, newValue, child){
                        return Text("₹ $newValue");
                      },
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/payment');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Material(
                      child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 50,
                              width: width * .8,
                              child: FlatButton(
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {},
                              ))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                height: 50,
                width: 50,
                // decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.all(Radius.circular(28))
                // ),

                // child: Icon(Icons.home,color: Colors.green,)
                child: IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/homescreen');
                    }),
              ),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                  )),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 50,
                width: 50,
                /* decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),*/
                // child: Icon(Icons.person,color: Colors.white,)
                child: IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/accountinfo');
                    }),
              ),
              title: Container(),
            ),
          ],
        ));
  }
}

class ProductCard extends StatefulWidget {
  final String name;

  final String shopName;
  final String price;
  int productqty;
  final String imageurl;

  //final String category;
  ProductCard({this.price, this.productqty, this.name, this.imageurl, this.shopName});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  // @override
  // void initState() {
  //   // setState(() => total.value += double.parse(widget.price));
  //   total.value += double.parse(widget.price);
  // }
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: width * .7,
        height: width * .35,
        //color: Colors.black87.withOpacity(.85),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: width * .4,
                width: width * .34,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/3.png',
                    height: width * .23,
                    width: width * .28,
                    fit: BoxFit.cover,
                  ),

                  /*child: Image.network(
                    widget.imageurl,
                    width: width * .12,
                    height: width * .12,
                    fit: BoxFit.cover,
                    //color: Colors.black87,
                  ),*/
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //direction: Axis.vertical,

                children: [
                  Text(
                    widget.name.toUpperCase(),
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .04),
                  ),
                  Text(
                    "${widget.shopName}",
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .04),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                            onTap: () {
                              
                                if (widget.productqty > 1){
                                  setState(() {
                                  widget.productqty = widget.productqty - 1;
                                  
                                  });
                                  total.value -= double.parse(widget.price);
                                }
                                  
                              
                            },
                            child: CircleAvatar(
                              child: Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                              radius: 13,
                              backgroundColor: Colors.grey[300],
                            )),
                      ),
                      Text(widget.productqty.toString()),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {

                                widget.productqty = widget.productqty + 1;
                                
                                // print(widget.productqty);
                              });
                              total.value += double.parse(widget.price);
                            },
                            child: CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              radius: 13,
                              backgroundColor: Colors.grey[300],
                            )),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Align(
                  alignment: Alignment(-1, -.8),
                  child: Text(
                    "₹ ${widget.price}",
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .04),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}
