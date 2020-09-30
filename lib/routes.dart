import 'package:flutter/material.dart';
import 'package:marketlist/screens/code.dart';
import 'package:marketlist/screens/home.dart';
import 'package:marketlist/screens/list.dart';
import 'package:marketlist/screens/login.dart';

Map <String, WidgetBuilder> routes(){
  return <String, WidgetBuilder>{
    '/' : (BuildContext context) => HomeScreen(),
    'login' : (BuildContext context) => LoginScreen(),
    'code' : (BuildContext context) => CodeScreen(),
    'list' : (BuildContext context) => ListDetail()
  };
}