import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_fb_authenticate/views/listview.dart';
import 'package:flutter_fb_authenticate/views/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
 Widget build(BuildContext context){
    //getHotels();
    return MaterialApp(
     title:'EG Test',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}