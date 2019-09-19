
import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository_impl.dart';

class PetListProvider {

 PetList petList = PetList(totalPets: 0,petCount: 0);
 final PetListRepository repo = PetListRepositoryImpl();

 Future<PetList> loadPetList() async {

   final response = await repo.getPetList("0", "1000");
   petList = response;
   return petList;

 }

}