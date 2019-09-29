
import 'package:cat_adopt_flutter/ui/main_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {

  SplashScreenPage() : super();

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

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
                padding: const EdgeInsets.only(top: 175.0),
                child: Text('Pet adoption and rescue powered by',style: TextStyle(fontSize: 16),),
              ),
              Image(
                image: AssetImage('images/adoptapet.png'),
                width: 200,
              ),
            ],
          )),
    );
  }
}