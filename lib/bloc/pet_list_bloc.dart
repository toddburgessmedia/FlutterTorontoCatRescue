
import 'dart:async';

import 'package:cat_adopt_flutter/bloc/bloc.dart';
import 'package:cat_adopt_flutter/bloc/pet_list_provider.dart';
import 'package:cat_adopt_flutter/model/pet_list.dart';

class PetListBloc implements Bloc {

  bool lazy = false;

  PetListBloc(this.lazy);


  final _petListController = StreamController<PetList>.broadcast();
  PetListProvider petListProvider = PetListProvider();

  Stream<PetList> get petListStream => _petListController.stream;

  void updatePetList() async {

    petListProvider.loadPetListAll()
    .then((petList) => _petListController.sink.add(petList))
    .catchError((error) => _petListController.sink.addError('We had a network error'));
  }

  void filterResults({String age = 'any age',String sex='a'}) {
    petListProvider.filterResults(sex: sex,age: age);
    _petListController.sink.add(petListProvider.filtered);
  }

  bool needsRefresh() {
    return petListProvider.isPetListOld();
  }

  String getCurrentSex() {
    return petListProvider.sexFilter;
  }

  String getCurrentAge() {
    return petListProvider.ageFilter;
  }

  @override
  void dispose() {
    _petListController.close();
  }
}

PetListBloc petListBloc = PetListBloc(false);