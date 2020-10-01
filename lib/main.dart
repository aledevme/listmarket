import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketlist/routes.dart';
 
void main(){
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Shop',
      initialRoute: '/',
      routes: routes()
    );
  }
}