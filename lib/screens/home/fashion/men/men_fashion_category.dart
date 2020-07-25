import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class MenFashionCategory extends StatefulWidget {
  String type;
  MenFashionCategory(String type) {
    this.type = type;
  }

  @override
  _MenFashionCategoryState createState() => _MenFashionCategoryState();
}

class _MenFashionCategoryState extends State<MenFashionCategory> {
  @override
  Widget build(BuildContext context) {
    // print(widget.type);
    double height = displayHeight(context);
    double width = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Container(
              width: width * .8,
              height: 45,
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
                      hintText: "Search for Products"),
                  validator: (value) {},
                ),
              ),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Container(
            width: width,
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection('fashion')
                  .document('men')
                  .collection(widget.type)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return Center(child: Text('Oops ! An error occured'));

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                        child: Column(
                      children: [
                        Text('Fetching Data ....',
                            style: TextStyle(fontStyle: FontStyle.italic)),
                        Padding(padding: EdgeInsets.only(top: 2.0)),
                        CircularProgressIndicator(),
                      ],
                    ));
                    break;

                  default:
                    if (snapshot.hasData == false)
                      return Center(
                          child: Text('No Items in this Category :)'));
                    else {
                      return GridView.builder(
                        itemCount: snapshot.data.documents.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          var doc = snapshot.data.documents[index];
                          return new GestureDetector(
                            onTap: () {
                              // print(doc.toString());
                              Navigator.pushNamed(context, '/productsdetail', arguments: doc);
                            },
                            child: Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage('assets/shirt.png'),
                                  fit: BoxFit.fitHeight,
                                  alignment: Alignment.topCenter,
                                )),
                                /* decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage())
                                    ),*/
                                child: FractionallySizedBox(
                                  alignment: Alignment.bottomCenter,
                                  heightFactor: .4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child:
                                    Padding(
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
                                        // Center(child: Text("${doc['name']}")),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
