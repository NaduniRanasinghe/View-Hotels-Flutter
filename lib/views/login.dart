import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'listview.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin(); //create an instance of facebookLogin
  //List hotelslist =[];

  //login method
  _loginWithFB() async{
    final result = await facebookLogin.logInWithReadPermissions(['email']); //accessing the profile information
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body); //decoding the JSON data
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
          HomePage();
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false );
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false );
        break;
    }

  }
//logout method
  _logout(){
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels List'),
      ) ,
        body:
        Container(
          alignment: Alignment.center,
          height: 700,
          color: Colors.white,
          child: _isLoggedIn
              ? Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                userProfile["picture"]["data"]["url"],
                height:50.0,
                width:50.0,),
              Text(userProfile["name"]),
              OutlineButton(
                child: Text("Logout"),
                onPressed: (){
                  _logout();
                },
              ),

              //HomePage(),
              //new Hotels(),
            ],

          )
              : OutlineButton(
            color: Colors.orange,
            child: Text('Login with Facebook'),
            onPressed:(){
              _loginWithFB();
            },
          ),
        ),
    );
  }

}
