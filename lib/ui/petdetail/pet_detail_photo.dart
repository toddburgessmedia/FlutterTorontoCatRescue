
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
  String placeHolder = 'images/tcr-placeholder.png';


  @override
  void initState() {
    super.initState();
    displayphoto = widget.photos[0].originalUrl;
  }


  void _changeImage(String newPhoto) {
    setState(() {
      placeHolder = displayphoto;
      displayphoto = newPhoto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column (
        children: <Widget>[
          FadeInImage.assetNetwork(placeholder: placeHolder , image: displayphoto,height: 350, ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.photos.map((photo) =>
                  Flexible(
                    flex: 1,
                    child: InkWell(
                        onTap: () => _changeImage(photo.originalUrl) ,
                        child:
                          FadeInImage.assetNetwork(placeholder: placeHolder , image: photo.thumbnailUrl,height: 100, )
                  )

                  )).toList()
          ),
        ],
    );
  }


}