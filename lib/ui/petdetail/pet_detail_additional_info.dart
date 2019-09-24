
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetDetailAdditionalInfo extends StatelessWidget {

  final PetDetailInfo info;

  PetDetailAdditionalInfo({Key key, this.info}) : super();

  Widget _goodOrNot(String key,int value) {

    if (value == 1) {
      return Text(key);
    } else if (value == 0) {
      return Text('Not ${key}',style: TextStyle(color: Colors.deepOrange));
    } else {
      return SizedBox.shrink(); // use for -1 value
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightGreen,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      borderOnForeground: true,
      child: Column(
        children: <Widget>[
          Divider(),
          Text('Additional Information',style: TextStyle(fontWeight: FontWeight.bold),),
          _goodOrNot('Up to Date with Shots', info.shotsCurrent),
          _goodOrNot('Good with Kids', info.goodWithKids),
          _goodOrNot('Good with Cats', info.goodWithCats),
          _goodOrNot('Good with Dogs', info.goodWithDogs),
          Divider(),
//          _goodOrNot('Declawed', info.declawed),
        ],
      ),
    );
  }


}