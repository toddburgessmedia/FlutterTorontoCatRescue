
import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository_impl.dart';

class PetListProvider {

 PetList petList;
 final PetListRepository repo = PetListRepositoryImpl();

 void loadPetList() async {

   petList = await repo.getPetList("0", "1000");

 }

}