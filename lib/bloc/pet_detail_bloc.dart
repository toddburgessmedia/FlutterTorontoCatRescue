
import 'dart:async';

import 'package:cat_adopt_flutter/bloc/bloc.dart';
import 'package:cat_adopt_flutter/bloc/pet_detail_provider.dart';
import 'package:cat_adopt_flutter/model/pet_detail.dart';

class PetDetailBloc implements Bloc {

  final _petDetailController = StreamController<PetDetail>.broadcast();
  PetDetailProvider provider = PetDetailProvider();

  Stream<PetDetail> get petDetailStream => _petDetailController.stream;

  void getPetDetail(String petID) async {
    provider.getPetDetail(petID)
    .then((petDetail) => _petDetailController.sink.add(petDetail))
    .catchError((error) => _petDetailController.sink.addError(error));
  }

  @override
  void dispose() {
    _petDetailController.close();
  }

}

PetDetailBloc petDetailBloc = PetDetailBloc();