
import 'package:cat_adopt_flutter/bloc/pet_list_bloc.dart';
import 'package:cat_adopt_flutter/ui/pet_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PetDetailError extends StatelessWidget {

  final String petID;

  PetDetailError({Key key, this.petID}) : super();

  void _tryAgain(BuildContext context) {

    petListBloc.updatePetList();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PetDetailPage(petID: petID,)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toronto Cat Rescue',)),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(75.0),
              child: Icon(Icons.error,size: 120,),
            ),
            Text('Unable to load cat\nPlease check network connection and try again',textScaleFactor: 2,textAlign: TextAlign.center,),
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