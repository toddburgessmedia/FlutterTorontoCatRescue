// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_detail_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PetDetailService extends PetDetailService {
  _$PetDetailService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PetDetailService;

  Future<Response> getPetDetail(
      String petID, String apikey, String shelterID, String output, String v) {
    final $url = 'https://api.adoptapet.com/search/pet_details';
    final Map<String, dynamic> $params = {
      'pet_id': petID,
      'key': apikey,
      'shelter_id': shelterID,
      'output': output,
      'v': v
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getLimitedPetDetail(
      int petID, String apikey, String shelterID, String output, String v) {
    final $url = 'https://api.adoptapet.com/search/limited_pet_details';
    final Map<String, dynamic> $params = {
      'pet_id': petID,
      'key': apikey,
      'shelter_id': shelterID,
      'output': output,
      'v': v
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
