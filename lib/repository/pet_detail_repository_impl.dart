
import 'dart:convert';

import 'package:cat_adopt_flutter/model/pet_detail.dart';
import 'package:cat_adopt_flutter/repository/pet_detail_repository.dart';
import 'package:cat_adopt_flutter/repository/pet_detail_service.dart';
import 'package:chopper/chopper.dart';

import 'api_keys.dart';

class PetDetailRepositoryImpl implements PetDetailRepository {

  final String shelterID = ApiKeys.shelterID;
  final String apiKey = ApiKeys.apiKey;


  @override
  Future<PetDetail> getPetDetail(String petID) async {

    final chopper = ChopperClient(
        services: [
          PetDetailService.create()
        ],
        converter: JsonConverter()
    );

    final petDetailService = PetDetailService.create(chopper);
    final response = await petDetailService.getPetDetail(petID, apiKey, shelterID, 'json', '2');

    final jsonData = json.decode(response.bodyString);
    final petDetail = PetDetail.fromJson(jsonData);

    return petDetail;
  }




}