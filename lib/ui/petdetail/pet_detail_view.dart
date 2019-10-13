
import 'package:cat_adopt_flutter/model/pet_detail.dart';
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';
import 'package:cat_adopt_flutter/ui/pet_adopt_page.dart';
import 'package:cat_adopt_flutter/ui/petdetail/pet_detail_additional_info.dart';
import 'package:cat_adopt_flutter/ui/petdetail/pet_detail_bonded.dart';
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

  Widget getAdoptText() {

    if (petDetail.bondedTo != null) {
      return Text('Adopt ${petDetail.petName} and ${petDetail.bondedFriend.pet.petName}');
    } else {
      return Text('Adopt ${petDetail.petName}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: <Widget>[
            FittedBox(fit: BoxFit.contain ,child: Text("Meow. My name is ${petDetail.petName}", textScaleFactor: 2,)),
            PetDetailPhoto(photos: petDetail.petImages),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PetDetailAdditionalInfo(info: petDetail),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PetDetailBonded(info: petDetail),
            ),
            Html(data: petDetail.description),
            RaisedButton(
              onPressed: () => _getAdoptionScreen(petDetail,context),
              child: getAdoptText()
            )

        ]
      ),
    );

  }


}

