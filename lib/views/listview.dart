import 'package:flutter/material.dart';
import 'package:flutter_fb_authenticate/services/api_manager.dart';
import 'package:flutter_fb_authenticate/models/Hotels.dart';
class HomePage extends StatefulWidget {

  HomePage(): super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Hotels> _hotels;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    API_Manager.getHotels().then((hotels){
      setState(() {
        _hotels = hotels;
        _loading = false;
      });
    });
  }



  @override
  Widget build(BuildContext context){
    print(_hotels);
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading? 'Loading...' : 'Hotels'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _hotels ? 0: _hotels.length,
          itemBuilder: (context, index) {
          Hotels hotel = _hotels[index];
          return ListTile(
            title:Text(hotel.title),
            subtitle: Text(hotel.description),
          );
        }),
      ),
    );
  }

}


