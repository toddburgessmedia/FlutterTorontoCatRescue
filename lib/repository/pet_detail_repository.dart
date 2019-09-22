
import 'package:cat_adopt_flutter/model/pet_detail.dart';

abstract class PetDetailRepository {

  Future<PetDetail> getPetDetail(String petID);

}