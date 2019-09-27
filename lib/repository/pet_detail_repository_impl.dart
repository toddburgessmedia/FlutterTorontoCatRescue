
import 'dart:convert';

import 'package:cat_adopt_flutter/model/limited_pet.dart';
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
    var petDetail = PetDetail.fromJson(jsonData);

    if (petDetail.petdetail.bondedTo != null) {
      //print("we are a bonded pair ${petDetail.petdetail.bondedTo}");
      final friend = await getLimitedPetDetail(petDetail.petdetail.bondedTo, petDetailService);
      petDetail.petdetail.bondedFriend = friend;
      print('friend is ${petDetail.petdetail.bondedFriend.pet.petName}');
    }

    return petDetail;
  }

  @override
  Future<LimitedPet> getLimitedPetDetail(int petID,PetDetailService service) async {

    final response = await service.getLimitedPetDetail(petID, apiKey, shelterID, 'json', '2');

    //print(response.bodyString);
    final jsonData = json.decode(response.bodyString);
    final limitedPet = LimitedPet.fromJson(jsonData);

    //print ('bonded friend ${limitedPet.pet.petName}');
    return limitedPet;

  }


}