
import 'dart:async';

import 'package:cat_adopt_flutter/bloc/bloc.dart';
import 'package:cat_adopt_flutter/bloc/pet_list_provider.dart';
import 'package:cat_adopt_flutter/model/pet_list.dart';

class PetListBloc implements Bloc {

  final _petListController = StreamController<PetList>.broadcast();
  PetListProvider petListProvider = PetListProvider();

  Stream<PetList> get petListStream => _petListController.stream;

  void updatePetList() async {
    await petListProvider.loadPetList();
    _petListController.sink.add(petListProvider.petList);
  }

  @override
  void dispose() {
    _petListController.close();
  }
}

PetListBloc petListBloc = PetListBloc();