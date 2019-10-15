
import 'package:cat_adopt_flutter/bloc/pet_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetListFilterAlert extends StatelessWidget {

  final BuildContext context;
  final sexList = ['Any Gender','Male','Female'];
  final ageList = ['Any Age','Kitten','Young','Adult','Senior'];


  PetListFilterAlert({Key key, this.context}) :super();

  @override
  Widget build(BuildContext context) {
    return
        AlertDialog(
          title: Text('Filter Cats by'),
          content: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 100),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Select Gender'),
                    DropdownButton<String>(
                      items: sexList.map((sexItem) =>
                          DropdownMenuItem<String>(
                            value: sexItem.substring(0,1).toLowerCase(),
                            child: Text(sexItem),
                          )
                      ).toList(),
                      hint: Text('Any Gender'),
//              value: "m",
                      onChanged: (sexValue) => petListBloc.filterBySex(sexValue),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Select Age'),
                    DropdownButton<String>(
                        items: ageList.map((ageItem) =>
                            DropdownMenuItem<String>(
                              value: ageItem.toLowerCase(),
                              child: Text(ageItem),
                            )
                        ).toList(),
                        hint: Text('Any Age'),
                        onChanged: (ageValue) => petListBloc.filterByAge(ageValue)
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
  }
}