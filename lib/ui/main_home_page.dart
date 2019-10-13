
import 'package:cat_adopt_flutter/ui/main/cat_list_grid_view.dart';
import 'package:cat_adopt_flutter/ui/main/pet_list_error.dart';
import 'package:cat_adopt_flutter/ui/main/pet_list_filter_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:cat_adopt_flutter/bloc/pet_list_bloc.dart';
import 'package:cat_adopt_flutter/model/pet_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flushbar/flushbar.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    petListBloc.updatePetList();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    if (state == AppLifecycleState.resumed) {
      print('we resumed');
      if (petListBloc.needsRefresh()) {
        _updatePetList();
      }
    }
  }

  void _updatePetList() {
    petListBloc.updatePetList();
    Flushbar(
      title: 'Refreshing Cat List',
      message: 'Updating the list of adorable cats',
      duration: Duration(seconds: 5),
      icon: Icon(Icons.refresh,color: Colors.white,),
    )..show(context);
  }

  Future<void> _showFilterAlert(BuildContext context) {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return PetListFilterAlert(context: context);

        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => _updatePetList(),
            ),
            IconButton(
              icon: Icon(Icons.filter),
              onPressed: () => _showFilterAlert(context),
            )
          ],
        ),
        body: StreamBuilder(
            stream: petListBloc.petListStream,
            builder: (context, AsyncSnapshot<PetList> snapshot) {
              if (snapshot.hasData) {
                return CatListGridView(petList: snapshot.data);
              } else if (snapshot.hasError) {
                return PetListError();
              }
              return Center(child: CircularProgressIndicator()); // still waiting for data
            }
            ),
        drawer: Drawer(
            child: ListView(
              children: <Widget>[
                  DrawerHeader(
                    child: Image(
                      image: AssetImage('images/TCR-Logo-RGB.jpg'),
                      height: 150,
                    ),
                  ),
                ListTile(
                  title: Text('Webpage'),
                  onTap: () => launch("https://torontocatrescue.ca"),
                ),
                ListTile(
                  title: Text('Volunteer'),
                  onTap: () => launch("https://torontocatrescue.ca/volunteer/"),
                ),
                ListTile(
                  title: Text('Donate'),
                  onTap: () => launch("https://www.canadahelps.org/en/dn/14811"),
                ),
              ],
            )
    ),
    );
  }
}