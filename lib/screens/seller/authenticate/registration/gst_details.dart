import 'package:flutter/material.dart';

import 'signature.dart';



class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _businessRadioValue = 0;
  var _bankRadioValue;
  final gstINController = new TextEditingController();
  final holdernameController = new TextEditingController();
  final accoutnController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: new Column(
          children: [
            SizedBox(
              height: 80.0,
            ),
            businessDetails(),
            SizedBox(
              height: 80.0,
            ),
            bankDetails(),
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

  bankDetails() {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Give your Bank Details',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          RadioListTile(
            title: Text('I have a bank account in my registered business name'),
            value: 1,
            groupValue: _bankRadioValue,
            onChanged: (val) {
              setState(() {
                _bankRadioValue = val;
              });
            },
            activeColor: Colors.black,
          ),
          RadioListTile(
            title: Text(
                'I have applied/will apply for bank account in my registered business'),
            value: 2,
            groupValue: _bankRadioValue,
            onChanged: (val) {
              setState(() {
                print(val);
                _bankRadioValue = val;
              });
            },
            activeColor: Colors.black,
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
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'Enter account holder\'s name',
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: holdernameController,
              validator: (val) =>
                  val.length == 0 ? 'Name can not be empty' : null,
            ),
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
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'Enter bank account number',
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: accoutnController,
              validator: (val) =>
                  val.length == 0 ? 'Account number can not be empty' : null,
            ),
          ),
        ],
      ),
    );
  }

  continueButton() {
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      onPressed: () async {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Signature()));
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
            activeColor: Colors.black,
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
            activeColor: Colors.black,
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
            activeColor: Colors.black,
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
                enabledBorder: OutlineInputBorder(
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
}