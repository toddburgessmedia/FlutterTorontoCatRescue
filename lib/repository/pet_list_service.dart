
import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:chopper/chopper.dart';

part "pet_list_service.chopper.dart";

@ChopperApi(baseUrl: 'https://api.adoptapet.com')
abstract class PetListService extends ChopperService {

  static PetListService create([ChopperClient client]) => _$PetListService(client);

  @Get(path: '/search/pets_at_shelter')
  Future<Response> getPetList(
    @Query('key') String key,
    @Query('shelter_id') String shelter_id,
    @Query('start_number') int start_number,
    @Query('end_number') int end_number,
    @Query('output') String output
  );

}