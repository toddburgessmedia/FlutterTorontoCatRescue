
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

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    /// Initialize data, then navigator to Home screen.
    _initData().then((value) {
      _navigateToHomeScreen();
    });
  }


  @override
  void dispose() {
    super.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
      child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Image(
                  image: AssetImage('images/TCR-Logo-RGB.jpg'),
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text('Pet adoption and rescue powered by\nAdopt-A-Pet',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,),
              ),
//              Image(
//                image: AssetImage('images/adoptapet.png'),
//                width: 200, 
//              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Text('Developed by\nTodd Burgess',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold),),
              )
            ],
          )),
    );
  }
}