import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_library_app/loginpage.dart';

class Splashserives{

  void isLogin(BuildContext context){
    
    Timer(Duration(seconds:3), () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginpage())));

  }

}