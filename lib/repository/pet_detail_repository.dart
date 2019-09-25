
import 'package:cat_adopt_flutter/model/limited_pet.dart';
import 'package:cat_adopt_flutter/model/limited_pet_detail.dart';
import 'package:cat_adopt_flutter/model/pet_detail.dart';

abstract class PetDetailRepository {

  Future<PetDetail> getPetDetail(String petID);

  //Future<LimitedPetDetail> getLimitedPetDetail(String petID);

}