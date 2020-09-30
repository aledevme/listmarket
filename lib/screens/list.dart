import 'package:flutter/material.dart';
class ListDetail extends StatefulWidget {
  @override
  _ListDetailState createState() => _ListDetailState();
}

class _ListDetailState extends State<ListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Text('Formulario'),
              )
            ],
          ),
        ),
      ),
    );
  }
}