
import 'package:cat_adopt_flutter/bloc/pet_detail_bloc.dart';
import 'package:cat_adopt_flutter/model/pet_detail.dart';
import 'package:cat_adopt_flutter/ui/petdetail/pet_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetDetailPage extends StatefulWidget {

  final String petID;

  PetDetailPage({Key key,this.petID}) : super(key: key);

  @override
  _PetDetailPageState createState() => _PetDetailPageState();

}

class _PetDetailPageState extends State<PetDetailPage> {

  @override
  void initState() {
    super.initState();
    petDetailBloc.getPetDetail(widget.petID);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cat Infromation'),
        ),
        body: StreamBuilder(
          stream: petDetailBloc.petDetailStream,
          builder: (context, AsyncSnapshot<PetDetail> snapshot) {
            if (snapshot.hasData) {
              return PetDetailView(petDetail: snapshot.data.petdetail);
            } else if (snapshot.hasError) {
              return Text ('Error loading data');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
    );
  }

}