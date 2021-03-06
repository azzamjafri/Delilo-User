import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:geolocator/geolocator.dart';



class GetLocationPage extends StatefulWidget {

  
  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  TextEditingController locationController = new TextEditingController();

  Position currentLocation;

  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                height: 230,
                child: Image.asset(
                  "assets/dellologo.png",
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    height: 40,
                    width: wid * .8,
                    //color: Colors.white.withOpacity(1),
                    child: Center(
                        child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/1.png',
                            scale: .1,
                          ),
                        ),
                        FlatButton(
                            onPressed: () {
                              getCurrentLocation();
                            },
                            child: Text(
                              "Click here to get location automatically",
                              style: TextStyle(
                                  fontSize: 12.5, fontStyle: FontStyle.italic),
                            )),
                      ],
                    )),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: 200,
                  child: Stack(children: [
                    Divider(
                      thickness: 3,
                      color: Colors.white,
                    ),
                    Center(
                        child: Text(
                      "OR",
                      style: TextStyle(fontSize: 20),
                    )),
                  ])),
            ),
            Container(
              margin: EdgeInsets.all(12),
              height: 5 * 24.0,
              width: wid * .8,
              child: Material(
                elevation: 1,
                shape: StadiumBorder(),
                child: TextFormField(
                  //key: __passwordkey,
                  controller: locationController,
                  enableInteractiveSelection: true,
                  maxLines: 5,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 4),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: "Type Your Address..."),
                  validator: (value) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  height: 50,
                  width: wid * .8,
                  child: FlatButton(
                      onPressed: () {
                        if(locationController.text != '') {
                          Firestore.instance.collection('users').document(user.uid).updateData({
                            'location' : locationController.text,
                          });
                        }else {
                          Firestore.instance.collection('users').document(user.uid).updateData({
                            'location' : currentLocation.latitude.toString() + ',' + currentLocation.longitude.toString(),
                            'member' : 'Gold Member'
                          });
                        }
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(color: Colors.white),
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
    .then((Position position) {
      setState(()=> currentLocation = position);
      
      // print(position.latitude.toString() + ' ****************************');
    } ).catchError((err){
      print(err.toString());
    });
  }
}
