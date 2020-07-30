import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/auth_service.dart';
import 'package:delilo/screens/seller/authenticate/selleregister.dart';
import 'package:flutter/material.dart';

class BusinessDetails extends StatefulWidget {
  @override
  _BusinessDetailsState createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  int _businessRadioValue = 0;
  var _bankRadioValue;
  final gstINController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: new Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0, bottom: 5.0),
              child: logo(),
            ),
            SizedBox(
              height: 20.0,
            ),
            businessDetails(),
            SizedBox(
              height: 80.0,
            ),
            continueButton(),
            SizedBox(
              height: 80.0,
            ),
          ],
        ),
      ),
    );
  }

  continueButton() {
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      onPressed: () async {
        await Firestore.instance.collection('sellers').document(user.uid).updateData({
          'gstin_number': gstINController.text,
        });
        Navigator.pushNamed(context, '/getbankdetails');
      },
      minWidth: MediaQuery.of(context).size.width / 1.35,
      color: Colors.green,
      child: Text("Continue",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, letterSpacing: 1.1)),
      height: 50.0,
    );
  }

  businessDetails() {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Give your Business Details',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          RadioListTile(
            title: Text('I have a GSTIN'),
            value: 1,
            groupValue: _businessRadioValue,
            onChanged: (val) {
              setState(() {
                _businessRadioValue = val;
              });
            },
            activeColor: Colors.green,
          ),
          RadioListTile(
            title:
                Text('I will only sell in GSTIN exempt categories like books'),
            value: 2,
            groupValue: _businessRadioValue,
            onChanged: (val) {
              setState(() {
                // print(val);
                _businessRadioValue = val;
              });
            },
            activeColor: Colors.green,
          ),
          RadioListTile(
            title: Text('I have applied/will apply for a GSTIN'),
            value: 3,
            groupValue: _businessRadioValue,
            onChanged: (val) {
              setState(() {
                _businessRadioValue = val;
              });
            },
            activeColor: Colors.green,
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: new TextFormField(
              textAlign: TextAlign.justify,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                suffix: GestureDetector(
                  onTap: () => gstVerified = true,
                  child: Text('Verify', style: TextStyle(color: Colors.green)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'GSTIN Number',
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: gstINController,
              validator: (val) =>
                  val.length < 6 ? 'GSTIN can not be less than 6 chars' : null,
            ),
          ),
        ],
      ),
    );
  }

  logo() {
    return Container(
        height: 125.0,
        width: 210.0,
        child: Image.asset('assets/dellologo.png'));
  }
}
