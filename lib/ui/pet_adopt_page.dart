
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class PetAdoptPage extends StatefulWidget {

  final PetDetailInfo info;

  PetAdoptPage({Key key, this.info}) : super();

  @override
  _PetAdoptPageState createState() => _PetAdoptPageState();

}

class _PetAdoptPageState extends State<PetAdoptPage> {


  void _callAdoptionTeam() async {

    final phoneURI = "tel://" + widget.info.areaCode + widget.info.phoneNumber;
    if (await canLaunch(phoneURI)) {
      launch(phoneURI);
    }
  }

  void _emailAdoptionTeam() async {

    final subject = "?subject=Adoption Equiry for ${widget.info.petName}&";
    final body = "body=I have fallen in love and want to adopt ${widget.info.petName}.\n\nMy phone number is: ";
    final email = "mailto:${widget.info.email}$subject$body".replaceAll(" ", "%20");
    launch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Adopt'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: <Widget>[
          Center(child: Text('Please read carefully',style: TextStyle(fontWeight: FontWeight.bold),)),
          //_displayAdoptionProcess(info.adoptionProcess, context),
          Html(data: widget.info.adoptionProcess),
          Center(child: Text('Contact the Adoption Team',style: TextStyle(fontWeight: FontWeight.bold),)),
          Center(
            child: ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  child: Text('E-Mail'),
                  onPressed: () => _emailAdoptionTeam(),
                ),
                RaisedButton(
                  child: Text('Call'),
                  onPressed: () => _callAdoptionTeam(),
                ),
              ],
            ),
          )
        ],
      ),
    )
    );
  }


}