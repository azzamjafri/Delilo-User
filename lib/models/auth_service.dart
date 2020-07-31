
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;




FirebaseUser user;

class AuthService {

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final facebookLogin = new FacebookLogin();

  // handleAuth() {
  //   return StreamBuilder(
  //     stream: FirebaseAuth.instance.onAuthStateChanged,
  //     builder: (BuildContext context, snapshot){
  //       if(snapshot.hasData)

  //         return HomeScreen();
  //       else

  //         return LoginPage();
  //     }, 
  //   );
  // }




  // Facebook OAuth
  loginWithFB() async{

    // print('starting....');

    // final result = await facebookLogin.logInWithReadPermissions(['email']);
    // final result = await facebookLogin.logIn(['cwsfirebase@gmail.com']);
    final result = await facebookLogin.logIn(['email']); 
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        
        break;

      case FacebookLoginStatus.cancelledByUser:
        // setState(() => _isLoggedIn = false );
        break;
      case FacebookLoginStatus.error:
        // setState(() => _isLoggedIn = false );
        break;
    }

  }

  logoutFB(){
    facebookLogin.logOut();
    
  }

  // Google OAuth
  signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

    final AuthResult authResult = await FirebaseAuth.instance.signInWithCredential(credential);
    final FirebaseUser userR = authResult.user;
    assert(!userR.isAnonymous);
    assert(await userR.getIdToken() != null);

    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    assert(userR.uid == currentUser.uid);
    // print(currentUser.uid + '*****************************');
    user = userR;
  }

  // Google OAuth signout
  signOutGoogle() async {
    await googleSignIn.signOut();
    
  }

  // signIn
  signIn(AuthCredential credential) {
    FirebaseAuth.instance.signInWithCredential(credential).whenComplete(() async {
      user = await FirebaseAuth.instance.currentUser();
    });
    
  }

  // signOut
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  // OTP Sign in
  signWithOTP(smsCode, verificationId) async {
    try{
      AuthCredential authCredential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
      await signIn(authCredential);
      user = await FirebaseAuth.instance.currentUser();
    }catch(error) {
      print(error.toString() + " ___________________________");
    }
  }


  // Email Sign up
  signUpWithEmail(String email, String password) async {
    AuthResult auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    // user = auth.user;
  }

  // Email Verification
  sendEmailVerification() async {
    FirebaseUser usr = await FirebaseAuth.instance.currentUser();
    usr.sendEmailVerification();
    
  }


  // Email Sign in
  signInWithEmail(String email, String password) async {
    AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    // return await result.user;
    user = result.user;
  }
}