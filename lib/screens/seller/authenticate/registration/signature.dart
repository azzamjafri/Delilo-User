import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';

import 'email_verification.dart';
import 'take_signature.dart';


// android:requestLegacyExternalStorage="true"  to be added in ANdroidManifest for file_picker

class Signature extends StatefulWidget {
  @override
  _SignatureState createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  int radioVal = 0;
  File file;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      body: getBody(),
    );
  }

  getBody() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 170.0,
            width: 170.0,
            child: Image.asset('assets/dellologo.png'),
          ),
        ),
        new Text('Signature',
            style: TextStyle(fontSize: 23.0, color: Colors.black, fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        RadioListTile(
            value: 0,
            groupValue: radioVal,
            activeColor: Colors.green,
            title: Text('I want to draw my signature on the screen',
                style: TextStyle(color: Colors.black)),
            onChanged: (val) {
              setState(() {
                radioVal = val;
                print(val);
              });
            }),
        RadioListTile(
            value: 1,
            groupValue: radioVal,
            activeColor: Colors.green,
            title: Text('I want to upload an image of my signature',
                style: TextStyle(color: Colors.black)),
            onChanged: (val) {
              setState(() {
                radioVal = val;
                print(val);
              });
            }),
        Padding(padding: EdgeInsets.all(15.0)),
        radioVal == 0 ? _signatureWidget() : _uploadWidget(),
        Padding(padding: EdgeInsets.all(15.0)),
        Padding(
          padding: const EdgeInsets.only(right: 35.0),
          child: Align(
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.green),
            ),
            alignment: Alignment.centerRight,
          ),
        ),
        Padding(padding: EdgeInsets.all(15.0)),
        continueButton(),
      ],
    );
  }

  continueButton() {
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      onPressed: () async {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => EmailVerification()));
      },
      minWidth: MediaQuery.of(context).size.width / 1.35,
      color: Colors.green,
      child: Text("Continue",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, letterSpacing: 1.1)),
      height: 50.0,
    );
  }

  _uploadWidget() {
    return GestureDetector(
      onTap: () async {
        // file = await FilePicker.getFile();
        final path = await FlutterDocumentPicker.openDocument();
        print(path.toString() + "**********************************8");
      },
      child: Container(
        height: 110.0,
        width: MediaQuery.of(context).size.width / 1.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        alignment: Alignment.center,
        child: Text(
          'Click here to upload',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }

  _signatureWidget() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignApp())),
      child: Container(
        height: 110.0,
        width: MediaQuery.of(context).size.width / 1.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        alignment: Alignment.center,
        child: Text(
          'Click here to sign !',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}