
import 'package:delilo/models/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';




class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);
    return Scaffold(
      body: SingleChildScrollView(
              child: Center(
          child: Column(
            children: [
              Container(height: 220,child: Image.asset("assets/dellologo.png",)),
              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: Text("LOGIN",style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:30.0),
                child: Container(
                  width: wid*.8,
                  child: Material(
                    elevation: 5,
                    shape: StadiumBorder(),
                    child: TextFormField(
                      //key: _mobilenumberkey,
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
              ),
              Container(
                width: wid*.8,
                child: Material(
                  elevation: 5,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    //key: _mobilenumberkey,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(

                        border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(10,0,10,0),
                          child: Icon(Icons.lock,size: 35,color: Colors.black.withOpacity(.75),),
                        ),
                        hintText: "Enter Password"
                    ),
                    validator: (value){},
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context, '/siginphone');},
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Text("Or Login With Phone Number",style: TextStyle(fontSize: 20),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/j.png'),fit: BoxFit.fitHeight),
                      ),
                      child: Align(alignment: Alignment(0.3,-.15),child: Text("Signin",style: TextStyle(color: Colors.white,fontSize: 15),)),
                    ),
                    GestureDetector(
                      onTap: () {
                        AuthService().signInWithGoogle().whenComplete(() => Navigator.pushNamedAndRemoveUntil(context, '/homescreen', (route) => false));
                        // AuthService().signInWithGoogle().whenComplete((value) {
                        //   user = value;
                        //   Navigator.pushNamedAndRemoveUntil(context, '/homescreen', (route) => false);
                        // });
                      },
                      child: Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/p.png'),fit: BoxFit.fitHeight),
                        ),
                        child: Align(alignment: Alignment(0.3,-.15),child: Text("Signin",style: TextStyle(color: Colors.white,fontSize: 15),)),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 45,width:wid*.8,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/homescreen');}, child: Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                ],
              ),
              Container(height: 37,child: Align(alignment: Alignment.bottomCenter,child: RichText(text: TextSpan(style: TextStyle(color: Colors.black87,fontSize: 20),children: [TextSpan(text: "Dont have a Account? "),TextSpan(text: "Register",style: TextStyle(color: Colors.green))])))),
            ],
          ),
        ),
      ),
    );
  }
}
