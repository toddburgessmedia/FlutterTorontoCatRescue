import 'package:cat_adopt_flutter/model/pet_detail.dart';
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';
import 'package:flutter/material.dart';

class PetDetailFacts extends StatefulWidget {

  final PetDetailInfo petDetail;

  PetDetailFacts({Key key, this.petDetail}) : super();

  @override
  _PetDetailFactsState createState() => _PetDetailFactsState();
}

class _PetDetailFactsState extends State<PetDetailFacts> {
  int rows = 1;

  int _setGridRows() {


    if (MediaQuery.of(context).orientation == Orientation.landscape)
      return 2;
    else
      return 1;

  }

  @override
  Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          Text('Facts About ${widget.petDetail.petName}',style: TextStyle(fontWeight: FontWeight.bold),),
          GridView.count(
            shrinkWrap: true,
              crossAxisCount: _setGridRows(),
              childAspectRatio: 25,
              children: <Widget>[
                GridTile(
                    child: RichText(
                        text: TextSpan(
                          text: 'Breed: ',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(text: widget.petDetail.primaryBreed, style: TextStyle(fontWeight: FontWeight.normal)),
                  ]),),),
                GridTile(
                  child: RichText(
                    text: TextSpan(
                        text: 'Colour: ',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: widget.petDetail.furColour, style: TextStyle(fontWeight: FontWeight.normal)),
                        ]),),),
                GridTile(
                  child: RichText(
                    text: TextSpan(
                        text: 'Gender: ',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: widget.petDetail.sex, style: TextStyle(fontWeight: FontWeight.normal)),
                        ]),),),
                GridTile(
                  child: RichText(
                    text: TextSpan(
                        text: 'Hair: ',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: widget.petDetail.hairLength, style: TextStyle(fontWeight: FontWeight.normal)),
                        ]),),),
              ],

          ),
        ],
      );
  }
}
