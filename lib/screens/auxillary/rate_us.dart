
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';




class RateUs extends StatefulWidget {
  @override
  _RateUsState createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {
  // MaterialColor yellowColor = MaterialColor(0xffffa812, colors);

  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: new Text('Rate Us'),
            centerTitle: true,

          ),
          body: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Would you like to rate our services ?', style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),),
                Padding(padding: EdgeInsets.all(15.0),),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "Rate Us",
                        stars: SmoothStarRating(
                            allowHalfRating: false,
                            onRated: (v) {
                              setState(() {
                                rating = v;
                              });
                            },
                            starCount: 5,
                            rating: rating,
                            size: 40.0,
                            isReadOnly:false,
//                            filledIconData: Icons.blur_off,
//                            halfFilledIconData: Icons.blur_on,
                            color: Colors.yellow,
                            borderColor: Colors.yellow,
                            spacing:1.0
                        ),
                        buttonText: "Rate",
                      ),
                    );
                  },
                  minWidth: MediaQuery.of(context).size.width/1.5,
                  color: Colors.brown,
                  child: Text("Rate Us",style: TextStyle(color: Colors.white)),

                ),


              ],
            ),
          ),

        );


  }
}


class CustomDialog extends StatelessWidget {
  final String title, buttonText;
  Widget stars;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.stars,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Thank You !"),
            content: new Text("Thanks for rating us. Your feedback is important to us."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    return Stack(
      children: <Widget>[

        //...bottom card part,
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              stars,
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),

              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    _showDialog();
//                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),





        //...top circlular image part,

        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: Consts.avatarRadius,
          ),
        ),
      ],
    );


  }

}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}