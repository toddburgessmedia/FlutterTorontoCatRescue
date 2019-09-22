
import 'package:cat_adopt_flutter/ui/main_home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(TCRPetList());

class TCRPetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toronto Cat Rescue',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainHomePage(title: 'Todd\'s Mystery App'),
    );
  }
}


