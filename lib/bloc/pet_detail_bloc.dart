
import 'dart:async';

import 'package:cat_adopt_flutter/bloc/bloc.dart';
import 'package:cat_adopt_flutter/bloc/pet_detail_provider.dart';
import 'package:cat_adopt_flutter/model/pet_detail.dart';

class PetDetailBloc implements Bloc {

  final _petDetailController = StreamController<PetDetail>();
  PetDetailProvider provider = PetDetailProvider();

  Stream<PetDetail> get petDetailStream => _petDetailController.stream;

  void getPetDetail(String petID) async {
    await provider.getPetDetail(petID);
    _petDetailController.sink.add(provider.petDetail);
  }

  @override
  void dispose() {
    _petDetailController.close();
  }

}