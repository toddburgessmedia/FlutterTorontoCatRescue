
import 'package:cat_adopt_flutter/model/pet.dart';

class PetList {

  int petCount;
  String status;
  int totalPets;
  List<Pet> petList;

  PetList({
    this.petCount,
    this.status,
    this.totalPets,
    this.petList
  });

  factory PetList.fromJson(Map<String, dynamic> parsedJson) {

    var list = parsedJson["pets"] as List;
    //print('petlist from json');
    //print(list);
    List<Pet> petList = list.map((i) => Pet.fromJson(i)).toList();

    return PetList(
      petCount: parsedJson["returned_pets"],
      status: parsedJson["status"],
      totalPets: parsedJson["total_pets"],
      petList: petList
    );
  }
}