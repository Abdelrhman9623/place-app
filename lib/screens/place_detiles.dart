import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/map_screen.dart';
import '../providers/great_place.dart';
class PlaceDetiles extends StatelessWidget {
  static const routeName = '/place-detiles';
  @override
  Widget build(BuildContext context) {
  final id = ModalRoute.of(context).settings.arguments;
  final selectedPlace = Provider.of<GreatPlace>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 275,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10,),
          Text(selectedPlace.title, textAlign: TextAlign.center,),
          // Text(selectedPlace.location.address, textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          FlatButton.icon(
            icon: Icon(Icons.visibility),
            label: Text('View In Map'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                  initialLocation: selectedPlace.location,
                  isSelected: false,
                )),
              );
            },
          ),
        ],
      ),
    );
  }
}