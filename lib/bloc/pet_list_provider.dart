

import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository.dart';
import 'package:cat_adopt_flutter/repository/pet_list_repository_impl.dart';

class PetListProvider {

  PetList petList = PetList(totalPets: 0, petCount: 0);
  DateTime petListAge = DateTime.now().subtract(Duration(hours: 12));
  final PetListRepository repo = PetListRepositoryImpl();

  PetList filtered = PetList();
  String sexFilter = 'a';
  String ageFilter = 'any age';

  int petCount = 0;
  final int increment = 24;
  int start = 1; // always start at 1 due to API
  int end = 0;

  Future<PetList> loadPetListAll() async {
    end = 2000;
    final response = await repo.getPetList(start, end);
    petList = response;

    petListAge = DateTime.now();
    return petList;
  }

  bool isPetListOld() {
    var timeDiff = DateTime.now().difference(petListAge);
    if (timeDiff.inHours >= 6) {
      return true;
    } else {
      return false;
    }
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

    print('start $start end $end');
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

  void filterResults({String sex = 'a', String age = 'any age'}) {
    sexFilter = sex;
    ageFilter = age;

    filtered.petList = petList.petList.where((pet) => pet.age == age || age == 'any age').toList();
    filtered.petList = filtered.petList.where((pet) => pet.sex == sex || sex == 'a').toList();
  }

}
