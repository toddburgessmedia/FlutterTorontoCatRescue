
import 'package:flutter/material.dart';

class AboutAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('About'),
      content: Text('Toronto Cat Rescue is a no-kill, non-profit, registered charity #72088-4691-RR000\n\n'
          'Toronto Cat Rescue App\nDeveloped by:\nTodd Burgess',textAlign: TextAlign.center,),
      actions: <Widget>[
        FlatButton(
          child: Text('Cool'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
