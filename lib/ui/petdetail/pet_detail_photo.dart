
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

  String displayphoto;


  @override
  void initState() {
    displayphoto = widget.photos[0].originalUrl;
  }


  void _changeImage(String newPhoto) {
    setState(() {
      displayphoto = newPhoto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column (
        children: <Widget>[
          Image.network(displayphoto),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.photos.map((photo) =>
                  InkWell(
                      onTap: () => _changeImage(photo.originalUrl) ,
                      child: Image.network(photo.thumbnailUrl))

    ).toList()
          ),
        ],
    );
  }


}