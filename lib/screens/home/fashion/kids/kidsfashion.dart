import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';


class KidsFashionScreen extends StatefulWidget {
  @override
  _KidsFashionScreenState createState() => _KidsFashionScreenState();
}

class _KidsFashionScreenState extends State<KidsFashionScreen> {
  int _index=0;
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,18.0,0,18),
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,), onPressed: (){Navigator.pop(context);}),
                    Container(
                      width: width*.8,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          // key: __passwordkey,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(

                              border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                child: Icon(Icons.search,size: 35,color: Colors.green.withOpacity(.75),),
                              ),
                              hintText: "Search for Products"
                          ),
                          validator: (value){},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Baby Clothes",style: TextStyle(fontSize: 20,color: Colors.green),),
                    Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 30,width:width*.2,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/kidsfashioncategory', arguments: 'baby');}, child: Text("More"))),

                  ],
                ),
              ),
               Container(
                width: width,
                height: 200,
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection('fashion')
                        .document('kids')
                        .collection('baby')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Center(child: Text('Oops ! An error occured'));
                      
                      
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                                child: Column(
                              children: [
                                Text('Loading Data ....', style: TextStyle(fontStyle: FontStyle.italic)),
                                Padding(padding: EdgeInsets.only(top: 2.0)),
                                CircularProgressIndicator(),
                              ],
                            ));
                            break;

                          default:
                          
                            if (snapshot.hasData == false)
                              return Center(child: Text('No Items :)'));
                            else{
                              return PageView.builder(
                              itemCount: snapshot.data.documents.length,
                              controller: PageController(viewportFraction: 0.4),
                              // onPageChanged: (int index) =>setState(() => _index = index),
                              onPageChanged: (index) => _index = index,
                              itemBuilder: (_, i) {
                                var doc = snapshot.data.documents[i];
                                return Transform.scale(
                                  scale: i == _index ? 1 : 0.9,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/productsdetail', arguments: doc);
                                    },
                                    child: Card(
                                      elevation: 6,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image:
                                              AssetImage('assets/fashion4.jpg'),
                                          fit: BoxFit.fitHeight,
                                          alignment: Alignment.topCenter,
                                        )),
                                        /* decoration: BoxDecoration(image: DecorationImage(image: AssetImage())),*/
                                        child: FractionallySizedBox(
                                          alignment: Alignment.bottomCenter,
                                          heightFactor: .4,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20))),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(8.0, 3.0, 3.0, 4.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('${doc['name']}', style: TextStyle(color: Colors.white)),
                                                  Center(child: Text('${doc['shop_name']}', style: TextStyle(color: Colors.white))),
                                                  Text('₹ ${doc['price']}', style: TextStyle(color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            }
                            
                        }
                      
                    }),
              ),
              // Container(
              //   width: width,
              //   height: 200,
              //   child:PageView.builder(
              //     itemCount: 4,
              //     controller: PageController(viewportFraction: 0.4),
              //     onPageChanged: (int index) => setState(() => _index = index),
              //     itemBuilder: (_, i) {
              //       return Transform.scale(
              //         scale: i == _index ? 1 : 0.9,
              //         child: Card(
              //           elevation: 6,
              //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              //           child: Container(
              //             decoration: BoxDecoration(
              //                 image: DecorationImage(image: AssetImage('assets/fashion4.jpg'),fit: BoxFit.fitHeight,
              //                   alignment: Alignment.topCenter,)
              //             ),
              //             /* decoration: BoxDecoration(
              //                 image: DecorationImage(image: AssetImage())
              //               ),*/
              //             child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .4,child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),child: Center(child: Text("Some Description")),),),

              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Girl kids",style: TextStyle(fontSize: 20,color: Colors.green),),
                    Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 30,width:width*.2,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/kidsfashioncategory', arguments: 'girls');}, child: Text("More"))),

                  ],
                ),
              ),
               Container(
                width: width,
                height: 200,
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection('fashion')
                        .document('kids')
                        .collection('girls')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Center(child: Text('Oops ! An error occured'));
                      
                      
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                                child: Column(
                              children: [
                                Text('Loading Data ....', style: TextStyle(fontStyle: FontStyle.italic)),
                                Padding(padding: EdgeInsets.only(top: 2.0)),
                                CircularProgressIndicator(),
                              ],
                            ));
                            break;

                          default:
                          
                            if (snapshot.hasData == false)
                              return Center(child: Text('No Items :)'));
                            else{
                              return PageView.builder(
                              itemCount: snapshot.data.documents.length,
                              controller: PageController(viewportFraction: 0.4),
                              // onPageChanged: (int index) =>setState(() => _index = index),
                              onPageChanged: (index) => _index = index,
                              itemBuilder: (_, i) {
                                var doc = snapshot.data.documents[i];
                                return Transform.scale(
                                  scale: i == _index ? 1 : 0.9,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/productsdetail', arguments: doc);
                                    },
                                    child: Card(
                                      elevation: 6,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image:
                                              AssetImage('assets/fashion4.jpg'),
                                          fit: BoxFit.fitHeight,
                                          alignment: Alignment.topCenter,
                                        )),
                                        /* decoration: BoxDecoration(image: DecorationImage(image: AssetImage())),*/
                                        child: FractionallySizedBox(
                                          alignment: Alignment.bottomCenter,
                                          heightFactor: .4,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20))),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(8.0, 3.0, 3.0, 4.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('${doc['name']}', style: TextStyle(color: Colors.white)),
                                                  Center(child: Text('${doc['shop_name']}', style: TextStyle(color: Colors.white))),
                                                  Text('₹ ${doc['price']}', style: TextStyle(color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            }
                            
                        }
                      
                    }),
              ),
              // Container(
              //   width: width,
              //   height: 200,
              //   child:PageView.builder(
              //     itemCount: 4,
              //     controller: PageController(viewportFraction: 0.4),
              //     onPageChanged: (int index) => setState(() => _index = index),
              //     itemBuilder: (_, i) {
              //       return Transform.scale(
              //         scale: i == _index ? 1 : 0.9,
              //         child: Card(
              //           elevation: 6,
              //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              //           child: Container(
              //             decoration: BoxDecoration(
              //                 image: DecorationImage(image: AssetImage('assets/fashion4.jpg'),fit: BoxFit.fitHeight,
              //                   alignment: Alignment.topCenter,)
              //             ),
              //             /* decoration: BoxDecoration(
              //                 image: DecorationImage(image: AssetImage())
              //               ),*/
              //             child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .4,child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),child: Center(child: Text("Some Description")),),),

              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Boy kids",style: TextStyle(fontSize: 20,color: Colors.green),),
                    Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 30,width:width*.2,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/kidsfashioncategory', arguments: 'boys');}, child: Text("More"))),

                  ],
                ),
              ),

               Container(
                width: width,
                height: 200,
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection('fashion')
                        .document('kids')
                        .collection('boys')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Center(child: Text('Oops ! An error occured'));
                      
                      
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                                child: Column(
                              children: [
                                Text('Loading Data ....', style: TextStyle(fontStyle: FontStyle.italic)),
                                Padding(padding: EdgeInsets.only(top: 2.0)),
                                CircularProgressIndicator(),
                              ],
                            ));
                            break;

                          default:
                          
                            if (snapshot.hasData == false)
                              return Center(child: Text('No Items :)'));
                            else{
                              return PageView.builder(
                              itemCount: snapshot.data.documents.length,
                              controller: PageController(viewportFraction: 0.4),
                              // onPageChanged: (int index) =>setState(() => _index = index),
                              onPageChanged: (index) => _index = index,
                              itemBuilder: (_, i) {
                                var doc = snapshot.data.documents[i];
                                return Transform.scale(
                                  scale: i == _index ? 1 : 0.9,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/product  sdetail', arguments: doc);
                                    },
                                    child: Card(
                                      elevation: 6,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image:
                                              AssetImage('assets/fashion4.jpg'),
                                          fit: BoxFit.fitHeight,
                                          alignment: Alignment.topCenter,
                                        )),
                                        /* decoration: BoxDecoration(image: DecorationImage(image: AssetImage())),*/
                                        child: FractionallySizedBox(
                                          alignment: Alignment.bottomCenter,
                                          heightFactor: .4,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20))),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(8.0, 3.0, 3.0, 4.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('${doc['name']}', style: TextStyle(color: Colors.white)),
                                                  Center(child: Text('${doc['shop_name']}', style: TextStyle(color: Colors.white))),
                                                  Text('₹ ${doc['price']}', style: TextStyle(color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            }
                            
                        }
                      
                    }),
              ),
              // Container(
              //   width: width,
              //   height: 200,
              //   child:PageView.builder(
              //     itemCount: 4,
              //     controller: PageController(viewportFraction: 0.4),
              //     onPageChanged: (int index) => setState(() => _index = index),
              //     itemBuilder: (_, i) {
              //       return Transform.scale(
              //         scale: i == _index ? 1 : 0.9,
              //         child: Card(
              //           elevation: 6,
              //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              //           child: Container(
              //             decoration: BoxDecoration(
              //                 image: DecorationImage(image: AssetImage('assets/fashion4.jpg'),fit: BoxFit.fitHeight,
              //                   alignment: Alignment.topCenter,)
              //             ),
              //             /* decoration: BoxDecoration(
              //                 image: DecorationImage(image: AssetImage())
              //               ),*/
              //             child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .4,child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),child: Center(child: Text("Some Description")),),),

              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),



            ],
          ),
        ),
      ),
    );
  }
}
