import 'dart:async';
import 'package:firebase_dumy/ui/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashServices{
  void isLogin(BuildContext,context){
 Timer(Duration(seconds:2),() =>
     Navigator.push(context, MaterialPageRoute(builder:(context) => LoginScreen(),)
 ));
  }
}