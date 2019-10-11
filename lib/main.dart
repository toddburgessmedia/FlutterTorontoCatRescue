
import 'package:cat_adopt_flutter/ui/main/pet_list_error.dart';
import 'package:cat_adopt_flutter/ui/main_home_page.dart';
import 'package:cat_adopt_flutter/ui/splash_screen_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(TCRPetList());

class TCRPetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toronto Cat Rescue',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 0, 33, 55)
      ),
//      home: MainHomePage(title: 'Toronto Cat Rescue'),
      home: SplashScreenPage(),


    );
  }
}


