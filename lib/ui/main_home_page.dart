
import 'package:cat_adopt_flutter/ui/main/cat_list_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:cat_adopt_flutter/bloc/pet_list_bloc.dart';
import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {

  @override
  void initState() {
    super.initState();
    petListBloc.updatePetList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
            stream: petListBloc.petListStream,
            builder: (context, AsyncSnapshot<PetList> snapshot) {
              if (snapshot.hasData) {
                return CatListGridView(petList: snapshot.data);
              } else if (snapshot.hasError) {
                return Center(child: Text ('Error'));
              }
              return Center(child: CircularProgressIndicator()); // still waiting for data
            }));
  }
}