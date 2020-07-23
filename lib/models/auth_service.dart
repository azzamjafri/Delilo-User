
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';






class AuthService {

  final GoogleSignIn googleSignIn = GoogleSignIn();

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


  // Google OAuth
  signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

    final AuthResult authResult = await FirebaseAuth.instance.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    assert(user.uid == currentUser.uid);
    return currentUser;
  }

  // Google OAuth signout
  signOutGoogle() async {
    await googleSignIn.signOut();
    print('user sign out');
  }

  // signIn
  signIn(AuthCredential credential) {
    FirebaseAuth.instance.signInWithCredential(credential);
  }

  // signOut
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signWithOTP(smsCode, verificationId) {
    try{
      AuthCredential authCredential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
      signIn(authCredential);
    }catch(error) {
      print(error.toString() + " ___________________________");
    }
  }
}