
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';
import 'package:cat_adopt_flutter/ui/pet_adopt_page.dart';
import 'package:cat_adopt_flutter/ui/petdetail/pet_detail_additional_info.dart';
import 'package:cat_adopt_flutter/ui/petdetail/pet_detail_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PetDetailView extends StatelessWidget {

  PetDetailInfo petDetail;

  PetDetailView({Key key,this.petDetail}) : super();

  void _getAdoptionScreen(PetDetailInfo info, BuildContext context) {

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PetAdoptPage(info: info))
    );

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
          Center(child: Text("Meow. My name is ${petDetail.petName}", textScaleFactor: 2,)),
          PetDetailPhoto(photos: petDetail.petImages),
          PetDetailAdditionalInfo(info: petDetail),
          Html(data: petDetail.description),
          RaisedButton(
            onPressed: () => _getAdoptionScreen(petDetail,context),
            child: Text('Adopt ${petDetail.petName}'),
          )

      ]
    );

  }


}

