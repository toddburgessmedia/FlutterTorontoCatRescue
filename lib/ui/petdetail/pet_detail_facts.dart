import 'package:cat_adopt_flutter/model/pet_detail.dart';
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';
import 'package:flutter/material.dart';

class PetDetailFacts extends StatelessWidget {

  final PetDetailInfo petDetail;
  int rows = 1;

  PetDetailFacts({Key key, this.petDetail}) : super();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context,orientation) {
      if (orientation == Orientation.landscape)
        rows = 2;
      else
        rows = 1;
      return Column(
        children: <Widget>[
          Text('Facts About ${petDetail.petName}',style: TextStyle(fontWeight: FontWeight.bold),),
          GridView.count(
            shrinkWrap: true,
              crossAxisCount: rows,
              childAspectRatio: 25,
              children: <Widget>[
                GridTile(child: Text('Breed: ${petDetail.primaryBreed}')),
                GridTile(child: Text('Colour: ${petDetail.furColour}')),
                GridTile(child: Text('Age: ${petDetail.age}')),
                GridTile(child: Text('Sex: ${petDetail.sex}')),
                GridTile(child: Text('Hair: ${petDetail.hairLength}'))
              ],

          ),
        ],
      );},
    );
  }
}
