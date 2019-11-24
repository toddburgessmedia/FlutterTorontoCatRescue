
import 'package:cat_adopt_flutter/ui/main_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreenPage extends StatefulWidget {

  SplashScreenPage() : super();

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  double screenFactor = 1.0;


  @override
  void initState() {
    super.initState();

    /// Initialize data, then navigator to Home screen.
    _initData().then((value) {
      _navigateToHomeScreen();
    });
  }


  Future _initData() async {
    await Future.delayed(Duration(seconds: 3));
  }

  void _navigateToHomeScreen() {
    /// Push home screen and replace (close/exit) splash screen.
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainHomePage(title: 'Toronto Cat Rescue',)));
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: OrientationBuilder(
        builder: (context,orientation) {
          if (orientation == Orientation.landscape)
            screenFactor = 3.0;
          else
            screenFactor = 1.0;
        return FittedBox(
          fit: BoxFit.fitHeight,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 125.0/screenFactor),
                child: Image(
                  image: AssetImage('images/TCR-Logo-RGB.jpg'),
                  height: 200/screenFactor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80.0/screenFactor),
                child: Text('Pet adoption and rescue powered by\nAdopt-A-Pet',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,),
              ),
//              Image(
//                image: AssetImage('images/adoptapet.png'),
//                width: 200,
//              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0/screenFactor),
                child: Text('Developed by\nTodd Burgess',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold),),
              )
            ],
          ),
        );},
      ),
    );
  }
}