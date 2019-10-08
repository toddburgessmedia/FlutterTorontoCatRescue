
import 'package:cat_adopt_flutter/model/pet_list.dart';

abstract class PetListRepository {

  Future<PetList> getPetList(int start, int end);

  Future<int> getPetListMetaCount();

}