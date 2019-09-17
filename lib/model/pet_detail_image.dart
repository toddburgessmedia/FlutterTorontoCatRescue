
class PetDetailImage {

  int originalWidth;
  int thumbnailWidth;
  String thumbnailUrl;
  int thumbnailHeight;
  String originalUrl;
  int getOriginalHeight;

  PetDetailImage(
  {
    this.originalWidth,
    this.thumbnailWidth,
    this.thumbnailUrl,
    this.thumbnailHeight,
    this.originalUrl,
    this.getOriginalHeight
  });

  factory PetDetailImage.fromJson(Map<String,dynamic> parsedJson) {
    return PetDetailImage(
      originalWidth: parsedJson["original_width"],
      thumbnailWidth: parsedJson["thumbnail_width"],
      thumbnailUrl: parsedJson["thumbnail_url"],
      thumbnailHeight: parsedJson["thumbnail_height"],
      originalUrl: parsedJson["original_url"],
      getOriginalHeight: parsedJson["original_height"]

    );
  }
}