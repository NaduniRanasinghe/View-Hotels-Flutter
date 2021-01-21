import 'package:flutter/material.dart';

class MapView extends StatefulWidget{
  MapView(): super();

  final String title = "Map";

  @override
  MapViewState  createState() => MapViewState();
}

class MapViewState extends State{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Colors.green,

      ),
      body: Container(),
    )
  );
  }

}