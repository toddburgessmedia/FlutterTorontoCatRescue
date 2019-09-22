import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatListGridView extends StatelessWidget {
  final PetList petList;

  CatListGridView({Key key, this.petList}) : super();

  String _getSex(String sex) {
    if (sex == "m") {
      return "Male";
    } else {
      return "Female";
    }
  }

  String _titleCase(String age) {

    return age.substring(0,1).toUpperCase() + age.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.15,
        children: petList.petList
            .map((pet) => Card(
                    child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                Center(child: Image.network(pet.resultsPhotoURL,fit: BoxFit.scaleDown,),),
                                Center(child: Text(pet.petName,style: TextStyle(fontWeight: FontWeight.bold),),),
                                Center(child: Text(_getSex(pet.sex))),
                                Center(child: Text(pet.primaryBreed)),
                                Center(child: Text(_titleCase(pet.age)),)
                            ]
                        )
                    )
            )
        ).toList());
  }
}
