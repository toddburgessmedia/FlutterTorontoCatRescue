
import 'package:cat_adopt_flutter/bloc/pet_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_home_page.dart';

class PetListError extends StatefulWidget {

  @override
  _PetListErrorState createState() => _PetListErrorState();
}

class _PetListErrorState extends State<PetListError> with WidgetsBindingObserver {

  double screenFactor = 1.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    if (state == AppLifecycleState.resumed) {
      print('we resumed');
      _tryAgain(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }



  void _tryAgain(BuildContext context) {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainHomePage(title: 'Toronto Cat Rescue',)));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: OrientationBuilder(
        builder: (context,orientation) {
          if (orientation == Orientation.landscape)
            screenFactor = 3.0;
          else
            screenFactor = 1.0;
          return Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(75.0/screenFactor),
                child: Icon(Icons.error,size: 120/screenFactor),
              ),
              Text('Unable to load cats\nPlease check network connection and try again',textScaleFactor: 2,textAlign: TextAlign.center,),
              Padding(
                padding: EdgeInsets.all(40.0/screenFactor),
                child: RaisedButton(
                  onPressed: () => _tryAgain(context),
                  child: Text('Try Again'),
                ),
              )
            ],

          ),
        );},
      ),

    );
  }
}