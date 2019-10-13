
import 'package:cat_adopt_flutter/bloc/pet_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_home_page.dart';

class PetListError extends StatelessWidget {

  void _tryAgain(BuildContext context) {

    petListBloc.updatePetList();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainHomePage(title: 'Toronto Cat Rescue',)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(75.0),
              child: Icon(Icons.error,size: 120,),
            ),
            Text('Unable to load cats\nPlease check network connection and try again',textScaleFactor: 2,textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: RaisedButton(
                onPressed: () => _tryAgain(context),
                child: Text('Try Again'),
              ),
            )
          ],

        ),
      ),

    );
  }
}