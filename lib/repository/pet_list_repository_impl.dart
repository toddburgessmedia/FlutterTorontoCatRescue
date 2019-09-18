
import 'dart:io';
import 'dart:convert';

import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:cat_adopt_flutter/repository/api_keys.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository.dart';
import 'package:cat_adopt_flutter/repository/pet_list_service.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';

class PetListRepositoryImpl implements PetListRepository {

  final String shelterID = ApiKeys.shelterID;
  final String apiKey = ApiKeys.apiKey;

  @override
  Future<PetList> getPetList(String start, String end) async {

    final chopper = ChopperClient(
      services: [
        PetListService.create()
      ],
      converter: JsonConverter()
    );

    final petListService = PetListService.create(chopper);

    final petList = await petListService.getPetList(apiKey, shelterID, 0, 1000);

    return petList.body;
  }

}