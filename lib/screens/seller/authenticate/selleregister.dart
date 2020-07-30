import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/auth_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



bool phoneVerified = false;
bool emailVerified = false;
bool gstVerified = false;
bool signatureVerified = false;
bool bankAccountVerified = false;
bool cancelChequeVerified = false;
String email;


class SellerRegisterScreen extends StatefulWidget {
  @override
  _SellerRegisterScreenState createState() => _SellerRegisterScreenState();
}

class _SellerRegisterScreenState extends State<SellerRegisterScreen> {


  String currentText;
  final key = GlobalKey<ScaffoldState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController otpController = TextEditingController();


  File file;
  String idUrl;
  int stat = 0;


  // Registration variables
  String smsCode, verificationId;
  bool codeSent = false;
  bool verified = false;
  bool registered = false;
  bool canRegister = false;
  AuthCredential loginKey;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);


    return SafeArea(
      child: Scaffold(
        key: key,
        body: Center(
          child: Container(
            width: wid,
            color: Color.fromRGBO(241,243,241, 1),
            /*decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/back.png'),fit: BoxFit.fitWidth)
            ),*/
            child: Form(
              child: ListView(
                /*    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,*/
                children: [
                  Container(height: 120,child: Image.asset("assets/dellologo.png",)),

                  Container(
                    height: 240,
                    child: Align(
                      alignment: Alignment(0,-1),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            //color: Colors.,
                            width: wid*.80,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                controller: userNameController,
                                enableInteractiveSelection: true,
                                decoration: InputDecoration(

                                    border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                      child: Icon(Icons.person,size: 35,color: Colors.black.withOpacity(.75),),
                                    ),
                                    hintText: "Enter Username"
                                ),
                                validator: (value){},
                              ),
                            ),
                          ),
                          Container(
                            width: wid*.8,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                controller: emailController,
                                enableInteractiveSelection: true,
                                decoration: InputDecoration(

                                    border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                      child: Icon(Icons.email,size: 35,color: Colors.black.withOpacity(.75),),
                                    ),
                                    hintText: "Enter Email"
                                ),
                                validator: (value){},
                              ),
                            ),
                          ),
                          Container(
                            width: wid*.8,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                controller: phoneController,
                                enableInteractiveSelection: true,
                                decoration: InputDecoration(

                                    border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                      child: Icon(Icons.phone,size: 35,color: Colors.black.withOpacity(.75),),
                                    ),
                                    hintText: "Enter Phone Number"
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value){},
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment(.1,-1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text("OTP Recievied", style: TextStyle(fontSize: 15.0)),
                          ),
                          Container(
                            color: Color.fromRGBO(241,243,241, 1),
                            
                            width: 220,
                            // height: 200,
                            child: PinCodeTextField(
                              length: 6,
                              obsecureText: false,
                              animationType: AnimationType.fade,
                              autoDisposeControllers: false,
                              pinTheme: PinTheme(
                                selectedColor: Colors.grey,
                                inactiveColor: Colors.grey,
                                selectedFillColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                shape: PinCodeFieldShape.circle,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 34,
                                activeFillColor: Colors.grey,
                              ),

                              //animationDuration: Duration(milliseconds: 300),
                              backgroundColor: Colors.transparent,
                              enableActiveFill: true,
                              //errorAnimationController: errorController,
                              controller: otpController,
                              onCompleted: (v) {
                                print("Completed");
                              },
                              onChanged: (value) {
                                print(value);
                                // setState(() {
                                  currentText = value;
                                // });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(.6,-1),
                    child: GestureDetector(
                      onTap: () {
                        phoneController.text = phoneController.text.trim();
                    codeSent
                        
                        ? AuthService().signWithOTP(smsCode, verificationId)
                        : verifyPhone("+91" + phoneController.text);

                    if (verified) {
                      setState(() {
                        key.currentState.showSnackBar(SnackBar(content: Text('Phone Number Verified !'),));
                      });
                    }
                      },
                      child: codeSent
                      ? Text("Submit the OTP Code",
                          style: TextStyle(color: Colors.green))
                      : Text("Get OTP",
                          style: TextStyle(color: Colors.green, fontSize: 15.0,))),
                      
                  ),

                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(12),
                            height: 5 * 20.0,
                            width: wid*.8,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(

                                controller: addressController,
                                enableInteractiveSelection: true,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                  child: Icon(Icons.location_on, size: 35,color: Colors.black.withOpacity(.75),),
                                ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                                    hintText: "Address",
                                    
                                ),
                                validator: (value){},
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () => uploadId(),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.04),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                                      icon: Icon(Icons.attach_file,size: 25,color: Colors.black.withOpacity(.75),),
                                      iconSize: 20.0,
                                      onPressed: null),
                          Container(
                              margin: EdgeInsets.only(right: 80, left: 40),
                              child: Text('I\'d proof', style: TextStyle( color: Colors.grey.shade700, fontSize: 16.0))),
                                  
                                ],
                              ),
                            )),
                      ),
                    ),

                    ],
                  ),



                  Padding(
                    padding: const EdgeInsets.only(top:25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),
                          height: 50,
                          width:wid*.7,
                          child: FlatButton(
                            onPressed: () async {
                              
                              if(stat != 3) key.currentState.showSnackBar(SnackBar(content: Text('Please upload Id proof'),));
                              else if(stat == 1) key.currentState.showSnackBar(SnackBar(content: Text('Please wait while we are uploading Id :)'),));
                              if(canRegister) {
                                email = emailController.text;
                                await Firestore.instance.collection('sellers').document(user.uid).setData({
                                  'name' : userNameController.text,
                                  'email' : emailController.text,
                                  'phone' : phoneController.text,
                                  'address' : addressController.text,
                                  'id' : idUrl,
                                  'password': 'test1234',
                                });
                                AuthService().signUpWithEmail(emailController.text.trim(), 'test1234');
                                AuthService().sendEmailVerification();
                                Navigator.pushNamed(context, '/getbusinessdetails');
                              }else{
                                key.currentState.showSnackBar(SnackBar(content: Text('Something Went Wrong !!'),));
                              }
                              
                              },
                            child: Text((stat == 1) ? "Uploading File.." : "Continue", style: TextStyle(color: Colors.white, fontSize: 22.0))
                          )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   uploadId() async {
    
    file = await FilePicker.getFile();
    setState(() {
      stat = (file == null) ? 0 : 1;
    });
    StorageReference storageReference = FirebaseStorage.instance.ref().child('seller_id_proof').child(user.uid);
    StorageUploadTask uploadTask = storageReference.putFile(file);
    await uploadTask.onComplete;
    idUrl = await storageReference.getDownloadURL();
    // print('File Uploaded !' + idUrl);
    setState(() {stat = 3;});
  }  


  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) async {
      // AuthService().signIn(authResult);
      FirebaseAuth.instance.signInWithCredential(authResult).then((usser) async {
        if (emailController != null &&
            phoneController != null &&
            userNameController != null ) {
          canRegister = true;
          phoneVerified = true;
        }
        await FirebaseAuth.instance.currentUser().then((value) {
          user = value;
        });
        
      });
      setState(() async {
        this.verified = true;
        this.loginKey = authResult;
        otpController.text = smsCode;
      });
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}'  + '***************************************');

      if (registered)
        key.currentState.showSnackBar(SnackBar(
          content: new Text('Already Registered please try Login'),
        ));

      registered = false;
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}








