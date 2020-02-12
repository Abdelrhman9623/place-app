import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/great_place.dart';
import './screens/places_list_view.dart';
import './screens/add_place_view.dart';


  void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlace(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}