
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';
import 'package:flutter/cupertino.dart';

class PetDetailView extends StatelessWidget {

  PetDetailInfo petDetail;

  PetDetailView({Key key,this.petDetail}) : super();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Meow. My name is ${petDetail.petName}"));
  }


}