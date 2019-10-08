
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

    if (lazy) {
      await petListProvider.loadPetListPage();
    } else {
      await petListProvider.loadPetListAll();
    }

    _petListController.sink.add(petListProvider.petList);
  }

  void filterBySex(String sex) {
    petListProvider.getPetsBySex(sex);
    _petListController.sink.add(petListProvider.filtered);
  }

  void filterByAge(String age) {
    petListProvider.getPetsByAge(age);
    _petListController.sink.add(petListProvider.filtered);
  }

  @override
  void dispose() {
    _petListController.close();
  }
}

PetListBloc petListBloc = PetListBloc(false);