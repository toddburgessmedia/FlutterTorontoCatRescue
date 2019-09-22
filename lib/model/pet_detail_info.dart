
import 'package:cat_adopt_flutter/model/pet_detail_image.dart';

class PetDetailInfo {

  String shelterName;
  String hairLength;
  String areaCode;
  String email;
  String shelterDescription;
  int goodWithDogs;
  String lastModified;
  int declawed;
  String description;
  String city;
  int spayed;
  String furColour;
  int goodWithCats;
  String postalCode;
  String petName;
  String species;
  int shotsCurrent;
  String adoptionProcess;
  int petID;
  String webURL;
  String primaryBreed;
  String areasServed;
  int goodWithKids;
  String phoneNumber;
  String countryCode;
  String age;
  String stateCode;
  String sex;
  int shelterID;
  int bondedTo;
  List<PetDetailImage> petImages;

  PetDetailInfo({
    this.shelterName,
    this.hairLength,
    this.areaCode,
    this.email,
    this.shelterDescription,
    this.goodWithDogs,
    this.lastModified,
    this.declawed,
    this.description,
    this.city,
    this.spayed,
    this.furColour,
    this.goodWithCats,
    this.postalCode,
    this.petName,
    this.species,
    this.shotsCurrent,
    this.adoptionProcess,
    this.petID,
    this.webURL,
    this.primaryBreed,
    this.areasServed,
    this.goodWithKids,
    this.phoneNumber,
    this.countryCode,
    this.age,
    this.stateCode,
    this.sex,
    this.shelterID,
    this.bondedTo,
    this.petImages
  });

  factory PetDetailInfo.fromJson(Map<String,dynamic> parsedJson) {

    var list = parsedJson["images"] as List;
    List<PetDetailImage> imageList = list.map((i) => PetDetailImage.fromJson(i)).toList();

    return PetDetailInfo(
      shelterName: parsedJson["shelter_name"],
      hairLength: parsedJson["hair_length"],
      areaCode: parsedJson["phone_area_code"],
      email: parsedJson["email"],
      shelterDescription: parsedJson["shelter_desc"],
      goodWithDogs: parsedJson["good_with_dogs"],
      lastModified: parsedJson["last_modified"],
      declawed: parsedJson["declawed"],
      description: parsedJson["description"],
      city: parsedJson["addr_city"],
      spayed: parsedJson["spayed_neutered"],
      furColour: parsedJson["color"],
      goodWithCats: parsedJson["good_with_cats"],
      postalCode: parsedJson["addr_postal_code"],
      petName: parsedJson["pet_name"],
      species: parsedJson["species"],
      shotsCurrent: parsedJson["shots_current"],
      adoptionProcess: parsedJson["adoption_process"],
      petID: parsedJson["pet_id"],
      webURL: parsedJson["website_url"],
      primaryBreed: parsedJson["primary_breed"],
      areasServed: parsedJson["areas_served"],
      goodWithKids: parsedJson["good_with_kids"],
      phoneNumber: parsedJson["phone_number"],
      countryCode: parsedJson["addr_country_code"],
      age: parsedJson["age"],
      stateCode: parsedJson["addr_state_code"],
      sex: parsedJson["sex"],
      shelterID: parsedJson["shelter_id"],
      bondedTo: parsedJson["bonded_to"],
      petImages: imageList
    );

  }



}