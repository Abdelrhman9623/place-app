import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_view.dart';
import '../screens/place_detiles.dart';
import '../providers/great_place.dart';
class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlace>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapShot) => snapShot.connectionState == ConnectionState.waiting ? 
        Center(child: CircularProgressIndicator()) : Consumer<GreatPlace>(
          child: Center(child: const Text('Got no places yet, start adding some!')),
          builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0 ? ch : ListView.builder(
            itemCount: greatPlaces.items.length,
            itemBuilder: (ctx, i) => ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(greatPlaces.items[i].image),
              ),
              title: Text(greatPlaces.items[i].title),
              subtitle: Text(greatPlaces.items[i].location.address),
              onTap: () {
                Navigator.of(context).pushNamed(
                  PlaceDetiles.routeName, 
                  arguments: greatPlaces.items[i].id
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
