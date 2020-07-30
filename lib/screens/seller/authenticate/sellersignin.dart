import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class SellerSigninScreen extends StatefulWidget {
  @override
  _SellerSigninScreenState createState() => _SellerSigninScreenState();
}

class _SellerSigninScreenState extends State<SellerSigninScreen> {
  bool checking = false;
  String message;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);
    return Scaffold(
      body: Center(
        child: (checking)
            ? Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200.0,
                      width: 200.0,
                      child: Image.asset('assets/dellologo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Please wait while we are verifying your credentials ',
                          style: TextStyle(
                            color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)),
                    CircularProgressIndicator(),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: Container(
                          height: 200,
                          child: Image.asset(
                            "assets/dellologo.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Container(
                            width: wid * .8,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                controller: emailController,
                                enableInteractiveSelection: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Icon(
                                        Icons.email,
                                        size: 35,
                                        color: Colors.black.withOpacity(.75),
                                      ),
                                    ),
                                    hintText: "Enter Email"),
                                validator: (value) {},
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: wid * .8,
                          child: Material(
                            elevation: 5,
                            shape: StadiumBorder(),
                            child: TextFormField(
                              controller: passwordController,
                              enableInteractiveSelection: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 4),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  prefixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Icon(
                                      Icons.lock,
                                      size: 35,
                                      color: Colors.black.withOpacity(.75),
                                    ),
                                  ),
                                  hintText: "Enter Password"),
                              obscureText: true,
                              validator: (value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 58.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              height: 55,
                              width: wid * .75,
                              child: FlatButton(
                                  onPressed: () {
                                    setState(() => checking = true);
                                    signIn();
                                  },
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ))),
                        ],
                      ),
                    ),
                    Container(
                        height: 37,
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/sellersignup');
                              },
                              child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 20),
                                      children: [
                                    TextSpan(text: "Dont have a Account? "),
                                    TextSpan(
                                        text: "Register",
                                        style: TextStyle(color: Colors.green))
                                  ])),
                            ))),
                  ],
                ),
              ),
      ),
    );
  }

  signIn() async {
    emailController.text = emailController.text.trim();
    bool nav = true;
    await Firestore.instance.collection('sellers').getDocuments().then((value) {
      value.documents.forEach((element) {
        print(element.data['email'] + '**\n');
        if (element.data['email'] == emailController.text) {
          if (element.data['password'] == passwordController.text.trim()) {
            nav = false;
            AuthService().signInWithEmail(emailController.text.trim(), 'test1234');
            Navigator.pushNamedAndRemoveUntil(context, '/sellerhome', (route) => false);
          } else {
            message = 'You Entered a Wrong Password';
            showDialog();
            nav = false;
          }
          checking = false;
        }
      });
    });

    if (nav) {
      setState(() {
        message = 'Your email is not registered with us yet';
        checking = false;
      });
      showDialog();
    }
  }

  void showDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child: SizedBox.expand(
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    side: BorderSide(color: Colors.green, width: 4.0)
                  ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(message,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400)),
                                  Padding(padding: EdgeInsets.all(20.0)),
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text('Try Again'),
                            color: Colors.greenAccent,
                          ),
                        ],
                      ),
                    ))),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
