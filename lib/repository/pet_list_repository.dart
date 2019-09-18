
import 'package:cat_adopt_flutter/model/pet_list.dart';

abstract class PetListRepository {

  Future<PetList> getPetList(String start, String end);

}