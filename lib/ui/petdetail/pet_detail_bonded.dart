
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import '../pet_detail_page.dart';

class PetDetailBonded extends StatefulWidget {

  final PetDetailInfo info;
  PetDetailBonded({Key key, this.info}) : super();

  @override
  _PetDetailBondedState createState() => _PetDetailBondedState();


}

class _PetDetailBondedState extends State<PetDetailBonded> {

  _getPetDetailScreen(BuildContext context) {

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PetDetailPage(petID: widget.info.bondedFriend.pet.petID.toString()))
    );
  }


  @override
  Widget build(BuildContext context) {
      if (widget.info.bondedTo == null) {
        return SizedBox.shrink();
      }
      return InkWell(
        onTap: () => _getPetDetailScreen(context),
        child: Card(
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Center(child: Text ('Bonded Pair Alert',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
              Row(
                children: <Widget>[
                  Flexible(child: Text('${widget.info.petName} is best friends with ${widget.info.bondedFriend.pet.petName} '
                      'and they need to be adopted together',style: TextStyle(fontSize: 18),)),
                  Image.network(widget.info.bondedFriend.pet.images[0].thumbnailUrl,width: 150,)
                ],
              )
            ],
          )


          ),
      );
  }


}