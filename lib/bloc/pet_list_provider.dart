
import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository_impl.dart';

class PetListProvider {

 PetList petList = PetList(totalPets: 0,petCount: 0);
 final PetListRepository repo = PetListRepositoryImpl();
 
 PetList filtered = PetList();
 String sexFilter = 'a';
 String ageFilter = 'any age';

 Future<PetList> loadPetList() async {

   final response = await repo.getPetList("0", "1000");
   petList = response;
   return petList;

 }
 
 void getPetsBySex(String sex) {

   sexFilter = sex;

   if (sex == 'a') {
     filtered.petList = petList.petList;
   } else {
     filterResults();
   }
 }

 void filterResults() {

   if ((sexFilter == 'a') && (ageFilter != 'any age')) {
     filtered.petList = petList.petList.where((pet) => pet.age == ageFilter).toList();
   } else if ((sexFilter != 'a') && (ageFilter == 'any age')) {
     filtered.petList = petList.petList.where((pet) => pet.sex == sexFilter).toList();
   } else {
     filtered.petList = petList.petList.where((pet) => pet.sex == sexFilter && pet.age == ageFilter).toList();
   }
 }


 void getPetsByAge(String age) {

   ageFilter = age;

   if (age == 'any age') {
     filtered.petList = petList.petList;
   } else {
     filterResults();
   }
 }

}