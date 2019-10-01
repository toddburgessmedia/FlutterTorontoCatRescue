
import 'package:cat_adopt_flutter/model/pet_detail_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

// TODO: verify launchers work on actual device
class PetAdoptPage extends StatefulWidget {

  final PetDetailInfo info;

  PetAdoptPage({Key key, this.info}) : super();

  @override
  _PetAdoptPageState createState() => _PetAdoptPageState();

}

class _PetAdoptPageState extends State<PetAdoptPage> {


  void _callAdoptionTeam() async {

    final phone = widget.info.areaCode + widget.info.phoneNumber;
    if (await canLaunch("tel://"+phone)) {
      launch("tel://" + phone);
    }
  }

  void _emailAdoptionTeam() async {

    final subject = "?subject=I want to adopt ${widget.info.petName}&".replaceAll(" ", "%20");
    final body = "body=I have fallen in love and want to adopt ${widget.info.petName}.\n".replaceAll(" ", "%20");
    final email = "mailto:" + widget.info.email + subject + body;
    launch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Adopt'),
    ),
    body: ListView(
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
    )
    );
  }


}