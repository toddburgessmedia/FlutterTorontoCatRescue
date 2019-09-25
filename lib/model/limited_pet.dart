import 'package:cat_adopt_flutter/model/limited_pet_detail.dart';

class LimitedPet {
  LimitedPetDetail pet;
  String status;

  LimitedPet({this.pet, this.status});

  factory LimitedPet.fromJson(Map<String,dynamic> parsedJson) {

    var petDetail = LimitedPetDetail.fromJson(parsedJson["pet"]);

    return LimitedPet(
      pet: petDetail,
      status: parsedJson['status']
    );
  }
}
