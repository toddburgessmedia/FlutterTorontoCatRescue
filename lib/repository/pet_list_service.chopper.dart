// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_list_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PetListService extends PetListService {
  _$PetListService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PetListService;

  Future<Response<PetList>> getPetList(
      String key, String shelter_id, int start_number, int end_number) {
    final $url = 'https://api.adoptapet.com/search/pets_at_shelter?output=json';
    final Map<String, dynamic> $params = {
      'key': key,
      'shelter_id': shelter_id,
      'start_number': start_number,
      'end_number': end_number
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PetList, PetList>($request);
  }
}
