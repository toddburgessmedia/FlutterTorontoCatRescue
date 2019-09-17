
import 'package:cat_adopt_flutter/model/pet_detail_image.dart';

class LimitedPetDetail {

  String petID;
  String petName;
  List<PetDetailImage> images;
  String petDetailsUrl;

  LimitedPetDetail({
    this.petID,
    this.petName,
    this.images,
    this.petDetailsUrl
  });

  factory LimitedPetDetail.fromJson(Map<String, dynamic> parsedJson) {

    var list = parsedJson["images"] as List;
    List<PetDetailImage> imageList = list.map((i) => PetDetailImage.fromJson(i)).toList();

    return LimitedPetDetail(
      petID: parsedJson["pet_id"],
      petName: parsedJson["pet_name"],
      petDetailsUrl: parsedJson["pet_details_url"],
      images: imageList
    );

  }

}