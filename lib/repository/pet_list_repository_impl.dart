
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
  final String output = 'json';
  final int meta = 1;

  ChopperClient chopper;

  PetListRepositoryImpl() {
    chopper = ChopperClient(
        services: [
          PetListService.create()
        ],
        converter: JsonConverter()
    );
  }

  @override
  Future<PetList> getPetList(int start, int end) async {

    final petListService = PetListService.create(chopper);

    final response = await petListService.getPetList(apiKey, shelterID, start, end,output);

    //print(response.body);
    final jsonData = json.decode(response.bodyString);

    final petList = PetList.fromJson(jsonData);
    print("pet count ${petList.petCount}");
    petList.petList.sort((a,b) => a.petName.compareTo(b.petName));
    return petList;
  }

  @override
  Future<int> getPetListMetaCount() async {

    final petListService = PetListService.create(chopper);
    final response = await petListService.getPetListMeta(apiKey, shelterID, 1, 2000, output, meta);

    final jsonData = json.decode(response.bodyString);
    final petList = PetList.fromJson(jsonData);
    print("pet count meta ${petList.petCount}");

    return petList.petCount;

  }


}