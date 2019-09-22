
import 'package:cat_adopt_flutter/model/pet_detail.dart';
import 'package:cat_adopt_flutter/repository/pet_detail_repository_impl.dart';

class PetDetailProvider {

  PetDetail petDetail;
  final repo = PetDetailRepositoryImpl();

  Future<PetDetail> getPetDetail(String petID) async {

    final petResponse = await repo.getPetDetail(petID);

    petDetail = petResponse;
    return petResponse;
  }

}