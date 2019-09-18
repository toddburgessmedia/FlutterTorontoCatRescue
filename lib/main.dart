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
      home: MainHomePage(title: 'Toronto Cat Rescue'),
    );
  }
}

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Adopt Some Cats',
            ),
          ],
        ),
      ),
    );
  }
}
