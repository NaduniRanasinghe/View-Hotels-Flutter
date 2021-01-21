import 'package:http/http.dart' as http;
import 'package:flutter_fb_authenticate/models/Hotels.dart';

class API_Manager{


  static Future <List<Hotels>> getHotels()async{
    try{
      final response = await http.get('https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json');
      if(200 == response.statusCode){
        final List<Hotels> hotels = hotelsFromJson(response.body) as List<Hotels>;
        return hotels;
      }else{
        return List<Hotels>();
      }

    }catch(e){
      return List<Hotels>();
    }
  }

}