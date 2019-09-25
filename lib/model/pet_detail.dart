
import 'package:cat_adopt_flutter/model/limited_pet.dart';
import 'package:cat_adopt_flutter/model/limited_pet_detail.dart';
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';

class PetDetail {

  PetDetailInfo petdetail;
  String status;
  LimitedPet bondedFriend;

  PetDetail({
    this.petdetail,
    this.status
  });

  factory PetDetail.fromJson(Map<String,dynamic> parsedJson) {

    var petDetail = PetDetailInfo.fromJson(parsedJson["pet"]);

    return PetDetail(
      status: parsedJson["status"],
      petdetail: petDetail
    );

  }

  set newfriend (LimitedPet friend) {
    bondedFriend = friend;
  }
}