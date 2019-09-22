
import 'package:cat_adopt_flutter/model/pet_detail.dart';
import 'package:chopper/chopper.dart';

part "pet_detail_service.chopper.dart";

@ChopperApi(baseUrl: 'https://api.adoptapet.com')
abstract class PetDetailService extends ChopperService {

  static PetDetailService create([ChopperClient client]) =>
      _$PetDetailService(client);

  @Get(path: "/search/pet_details")
  Future<Response> getPetDetail(
      @Query("pet_id") String petID,
      @Query("key") String apikey,
      @Query("shelter_id") String shelterID,
      @Query("ouput") String output,  // ="json",
      @Query("v") String v  //= "2" });
  );

  @Get(path: '/search/limited_pet_details')
  Future<Response> getLimitedPetDetail(
    @Query("pet_id") String petID,
    @Query("key") String apikey,
    @Query("shelter_id") String shelterID,
    @Query("output") String output, // = "json",
    @Query("v") String v  // = "2"
  );

}