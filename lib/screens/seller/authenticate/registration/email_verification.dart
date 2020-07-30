import 'package:delilo/screens/seller/authenticate/selleregister.dart';
import 'package:flutter/material.dart';


class EmailVerification extends StatefulWidget {
  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool check = true;
  double verify = 0.0;

  @override
  void initState() {

    super.initState();

    if(phoneVerified) verify += 0.14285;
    if(emailVerified) verify += 0.14285;
    else verify += 0.07112;
    if(gstVerified) verify += 0.14285;
    if(signatureVerified) verify += 0.14285;
    if(bankAccountVerified) verify += 0.14285;
    if(cancelChequeVerified) verify += 0.14285;
    

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      body: new SingleChildScrollView(
        child: getBody(),
      ),
    );
  }

  getBody() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
          child: logo(),
        ),
        verificationCard(),
        detailsCard(),
        continueButton(),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }

  detailsCard() {
    return Container(
      height: 500.0,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        margin: EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Text('Your store name will appear here'),
                alignment: Alignment.center,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Row(
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    child: Image.asset('assets/1.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      height: 15.0,
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        value: verify,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                'Account Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  
                ),
                
                child: twoCheckRows('Email Verification', emailVerified),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, ),
                child: twoCheckRows('Phone Verification', phoneVerified),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
              ),
              Text(
                'Business Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, ),
                child: twoCheckRows('GSTIN', gstVerified),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, ),
                child: twoCheckRows('Signature Verification', signatureVerified),
              ),
              
              Padding(
                padding: EdgeInsets.all(6.0),
              ),
              Text(
                'Bank Account Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, ),
                child: twoCheckRows('Bank Account Verification', bankAccountVerified),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, ),
                child: checkRow('Cancelled Cheque'),
              ),
              
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                'Product Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 10.0,
                ),
                child: checkRow('Listing Created'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkRow(String param) {
    return Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0)),
              Container(
                height: 11.5,
                width: 11.5,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0, left: 10.0),
              ),
              Text('$param'),
            ],
          );
  }

  continueButton() {
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      onPressed: () {
        
        Navigator.pushNamedAndRemoveUntil(context, '/sellerlogin', (route) => false);
        // Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginPage()));
      },
      minWidth: MediaQuery.of(context).size.width / 1.35,
      color: Colors.green,
      child: Text("Continue",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, letterSpacing: 1.1)),
      height: 50.0,
    );
  }

  twoCheckRows(String v1, bool verified) {
    return Row(
      children: [
        Container(
          height: 30.0,
          width: 25.0,
          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: (verified) ? Image.asset('assets/greentick.png') : Image.asset('assets/yellowtick.png'),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
        ),
        Text('$v1'),
      ],
    );
  }

  verificationCard() {
    return Container(
      height: 265.0,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        margin: EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email Verification',
                  style:
                      TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                  'We have send an email with subject line : (Dello MarketPlcae) - Account Verification to your registered email address'),
              Text(
                  '\"xxxxxx@gmail.com\" please open the mail and click on verification link'),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text('Verification link expires in 24 hrs. If it is expired '),
              Text(
                'click here',
                style: TextStyle(color: Colors.green),
              ),
              Text(' to resend the verification link'),
            ],
          ),
        ),
      ),
    );
  }

  logo() {
    return Container(
        height: 120.0, width: 200.0, child: Image.asset('assets/dellologo.png'));
  }
}