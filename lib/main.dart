import 'package:cat_adopt_flutter/bloc/pet_list_bloc.dart';
import 'package:cat_adopt_flutter/model/pet_list.dart';
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

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {

    @override
  void initState() {
    super.initState();
    petListBloc.updatePetList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
            stream: petListBloc.petListStream,
            builder: (context, AsyncSnapshot<PetList> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.petList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(snapshot.data.petList[index].largePhotoURL),
                        title: Text(snapshot.data.petList[index].petName),
                      subtitle: Text(snapshot.data.petList[index].primaryBreed),
                      isThreeLine: true,
                    );
                  },
                );
              } else if (snapshot.hasError){
              return Text ('Error');
            }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
