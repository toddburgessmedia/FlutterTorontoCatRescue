import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:cat_adopt_flutter/ui/pet_detail_page.dart';
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

  void _getPetDetailScreen(String petID, BuildContext context) {

   Navigator.push(
       context,
        MaterialPageRoute(builder: (context) => PetDetailPage(petID: petID))
   );

  }

  int _getGridSize(BuildContext context) {

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return 2;
    } else {
      return 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      GridView.builder(
      itemCount: petList.petList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _getGridSize(context)),
      itemBuilder: (BuildContext context, int index) {
        final pet = petList.petList[index];
        return InkResponse(
              onTap: () => _getPetDetailScreen(pet.petID, context),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: FadeInImage.assetNetwork(placeholder: 'images/tcr-placeholder.png' , image: pet.resultsPhotoURL,height: 100, ),),
                    Center(child: Text(pet.petName,style: TextStyle(fontWeight: FontWeight.bold),),),
                    Center(child: Text(_getSex(pet.sex))),
                    Center(child: Text(pet.primaryBreed)),
                    Center(child: Text(_titleCase(pet.age)),)
                  ]
              )
          );
      },
    );
  }
}
