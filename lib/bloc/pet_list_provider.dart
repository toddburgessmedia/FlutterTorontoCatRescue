

import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository_impl.dart';

class PetListProvider {

 PetList petList = PetList(totalPets: 0,petCount: 0);
 final PetListRepository repo = PetListRepositoryImpl();
 
 PetList filtered = PetList();
 String sexFilter = 'a';
 String ageFilter = 'any age';

 int petCount = 0;
 final int increment = 24;
 int start = 1;  // always start at 1 due to API
 int end = 0;

 Future<PetList> loadPetListAll() async {

   end = 2000;
   final response = await repo.getPetList(start, end);
   petList = response;

   return petList;

 }

 Future<PetList> loadPetListPage() async {

   if (petCount == 0) {
     getPetCount();
     end = increment;
     loadPetListAll();
   } else {
     start = end;
     end += increment;
   }

   print ('start $start end $end');
   //final response = await repo.getPetList(start, end);
   //final petListPage = response;
   //print('total page pets : ${petListPage.totalPets}');

//   if (petList.petList != null) {
//     petList.petList.addAll(petListPage.petList);
//     petList.totalPets += petListPage.totalPets;
//   } else {
//     petList = petListPage;
//   }

   return petList;
 }

 Future<void> getPetCount() async {

   petCount = await repo.getPetListMetaCount();

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