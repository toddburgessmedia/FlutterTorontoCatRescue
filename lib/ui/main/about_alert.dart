
import 'package:flutter/material.dart';

class AboutAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('About'),
      content: Text('Toronto Cat Rescue App\n\nDeveloped by:\nTodd Burgess',textAlign: TextAlign.center,),
      actions: <Widget>[
        FlatButton(
          child: Text('Cool'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
