import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: RaisedButton(
              onPressed: (){},
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Entrar'),
            ),
          ),
        ),
      ),
    );
  }
}