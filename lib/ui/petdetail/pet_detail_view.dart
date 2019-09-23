
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';
import 'package:cat_adopt_flutter/ui/petdetail/pet_detail_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class PetDetailView extends StatelessWidget {

  PetDetailInfo petDetail;

  PetDetailView({Key key,this.petDetail}) : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("Meow. My name is ${petDetail.petName}", textScaleFactor: 2,),
          PetDetailPhoto(photos: petDetail.petImages),
          Expanded(child: Text(petDetail.description))
        ],
      ),
    );

  }


}

