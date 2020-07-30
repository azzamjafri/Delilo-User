import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/auth_service.dart';
import 'package:delilo/screens/seller/authenticate/selleregister.dart';
import 'package:flutter/material.dart';

import 'signature.dart';



class BankDetails extends StatefulWidget {
  @override
  _BankDetailsState createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {

  bool ifscCheck = false;
  int _businessRadioValue = 0;
  var _bankRadioValue;
  final ifscController = new TextEditingController();
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
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 2.0),
              child: logo(),
            ),
            SizedBox(
              height: 15.0,
            ),
            bankDetails(),
            SizedBox(
              height: 18.0,
            ),
            continueButton(),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  logo() {
    return Container(
        height: 120.0, width: 210.0, child: Image.asset('assets/dellologo.png'));
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
            activeColor: Colors.green,
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
            activeColor: Colors.green,
          ),
          SizedBox(
            height: 15.0,
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
                  onTap: () => bankAccountVerified = true,
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
                hintText: 'IFSC Number',
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: ifscController,
              validator: (val) =>
                  val.length < 6 ? 'GSTIN can not be less than 6 chars' : null,
            ),
          ),
          SizedBox(height: 25.0),

          CheckboxListTile(
            value: ifscCheck, 
            onChanged: (val) => setState(() => ifscCheck = val),
            title: Text('I don\'t know my IFSC Code'),
            controlAffinity: ListTileControlAffinity.leading,
            checkColor: Colors.green,
            activeColor: Colors.white,
            ),
 
        ],
      ),
    );
  }

  continueButton() {
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      onPressed: () async {
        await Firestore.instance.collection('sellers').document(user.uid).updateData({
          'account_number' : accoutnController.text,
          'account_name': holdernameController.text,
          'ifsc_code' : ifscController.text,
        });
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

}