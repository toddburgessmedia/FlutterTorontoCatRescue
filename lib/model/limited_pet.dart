class LimitedPet {
  String pet;
  String status;

  LimitedPet({this.pet, this.status});

  factory LimitedPet.fromJson(Map<String,dynamic> parsedJson) {
    return LimitedPet(
      pet: parsedJson['pet'],
      status: parsedJson['status']
    );
  }
}
