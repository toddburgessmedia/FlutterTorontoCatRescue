
class Pet {

  String age;
  int order;
  String petID;
  String petName;
  String primaryBreed;
  String species;
  String sex;
  String detailsURL;
  String largePhotoURL;
  String resultsPhotoURL;
  String state;
  String city;

  Pet({
    this.petID,
    this.petName,
    this.primaryBreed,
    this.species,
    this.sex,
    this.age,
    this.order,
    this.detailsURL,
    this.largePhotoURL,
    this.resultsPhotoURL,
    this.state,
    this.city
  });

  factory Pet.fromJson(Map<String,dynamic> parsedJson) {

    return Pet(
      petID: parsedJson["pet_id"],
      petName: parsedJson["pet_name"],
      primaryBreed: parsedJson["primary_breed"],
      species: parsedJson["species"],
      sex: parsedJson["sex"],
      age: parsedJson["age"],
      order: parsedJson["order"],
      detailsURL: parsedJson["details_url"],
      largePhotoURL: parsedJson["large_results_photo_url"],
      resultsPhotoURL: parsedJson["results_photo_url"],
      state: parsedJson["addr_state_code"],
      city: parsedJson["addr_city"]
    );

  }

}