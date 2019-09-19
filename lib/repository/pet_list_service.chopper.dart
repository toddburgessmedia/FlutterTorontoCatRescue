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

  Future<Response> getPetList(String key, String shelter_id, int start_number,
      int end_number, String output) {
    final $url = 'https://api.adoptapet.com/search/pets_at_shelter';
    final Map<String, dynamic> $params = {
      'key': key,
      'shelter_id': shelter_id,
      'start_number': start_number,
      'end_number': end_number,
      'output': output
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
