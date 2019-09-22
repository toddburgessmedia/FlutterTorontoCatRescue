
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';

class PetDetail {

  PetDetailInfo petdetail;
  String status;

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
}