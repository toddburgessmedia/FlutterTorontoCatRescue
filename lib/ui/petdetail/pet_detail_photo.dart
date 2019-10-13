
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cat_adopt_flutter/model/pet_detail_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetDetailPhoto extends StatefulWidget {

  final List<PetDetailImage> photos;

  PetDetailPhoto({Key, key,this.photos}) : super();

  @override
  _PetDetailPhotoState createState() => _PetDetailPhotoState();

}

class _PetDetailPhotoState extends State<PetDetailPhoto> {

  String placeHolder = 'images/tcr-placeholder.png';

  @override
  Widget build(BuildContext context) {
    if (widget.photos.length == 1) {
      return FadeInImage.assetNetwork(
        placeholder: placeHolder, image: widget.photos[0].originalUrl, height: 350,);
    } else {
      return
        CarouselSlider(
          height: 350,
          autoPlay: true,
          pauseAutoPlayOnTouch: Duration(seconds: 60),
          autoPlayInterval: Duration(seconds: 4),
          enlargeCenterPage: true,
          autoPlayCurve: Curves.easeInSine,
          autoPlayAnimationDuration: Duration(milliseconds: 750),
          items: widget.photos.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Image.network(image.originalUrl);
              },
            );
          }).toList(),
        );
    }
  }


}