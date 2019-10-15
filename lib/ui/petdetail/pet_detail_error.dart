
import 'package:cat_adopt_flutter/bloc/pet_list_bloc.dart';
import 'package:cat_adopt_flutter/ui/pet_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PetDetailError extends StatefulWidget {

  final String petID;

  PetDetailError({Key key, this.petID}) : super();

  @override
  _PetDetailErrorState createState() => _PetDetailErrorState();
}

class _PetDetailErrorState extends State<PetDetailError> with WidgetsBindingObserver {

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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PetDetailPage(petID: widget.petID,)));
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