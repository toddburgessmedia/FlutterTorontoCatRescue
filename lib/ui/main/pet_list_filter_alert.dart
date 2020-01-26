
import 'package:cat_adopt_flutter/bloc/pet_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetListFilterAlert extends StatefulWidget {

  final BuildContext context;


  PetListFilterAlert({Key key, this.context}) :super();

  @override
  _PetListFilterAlertState createState() => _PetListFilterAlertState();
}

class _PetListFilterAlertState extends State<PetListFilterAlert> {

  final sexList = ['Any Sex','Male','Female'];
  var sexListValue = petListBloc.getCurrentSex();

  final ageList = ['Any Age','Kitten','Young','Adult','Senior'];
  var ageListValue = petListBloc.getCurrentAge();

  void _resetValues() {
    petListBloc.filterResults();
    setState(() {
      sexListValue = 'a';
      ageListValue = 'any age';
    });
  }

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
                    Text('Select Sex'),
                    DropdownButton<String>(
                      value: sexListValue,
                      items: sexList.map((sexItem) =>
                          DropdownMenuItem<String>(
                            value: sexItem.substring(0,1).toLowerCase(),
                            child: Text(sexItem),
                          )
                      ).toList(),
                      hint: Text('Any Gender'),
                      onChanged: (sexValue) {
                        petListBloc.filterResults(sex: sexValue,age: ageListValue);
                        setState(() {
                          sexListValue = sexValue;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Select Age'),
                    DropdownButton<String>(
                        value: ageListValue,
                        items: ageList.map((ageItem) =>
                            DropdownMenuItem<String>(
                              value: ageItem.toLowerCase(),
                              child: Text(ageItem),
                            )
                        ).toList(),
                        hint: Text('Any Age'),
                        onChanged: (ageValue) {
                          petListBloc.filterResults(age: ageValue,sex: sexListValue);
                          setState(() {
                            ageListValue = ageValue;
                          });

                        },
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Reset'),
              onPressed: () => _resetValues(),
            ),
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
  }
}