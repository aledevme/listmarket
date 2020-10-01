import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class ListDetail extends StatefulWidget {
  @override
  _ListDetailState createState() => _ListDetailState();
}

class _ListDetailState extends State<ListDetail> {
  @override
  Widget build(BuildContext context) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light
      ),
      child:Scaffold(
      appBar: EmptyAppBar(),
      backgroundColor:Color(0xffff1654),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                  ],
                ),
              ),

              Container(
                child: listItems(),
              )
            ],
          )
        ),
      ),
      )
    );
  }

  Widget listItems(){
    return StreamBuilder(
      stream: Firestore.instance.collection('lists').where('email', isEqualTo: 'alexgve7@gmail.com').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasData){
          return Expanded(
              child: ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document){
                  return Container(
                    child: Text(document['email']),
                  );
                }).toList()
              ),
            );

        }else{
          return CircularProgressIndicator();
        }
      },
    );
  
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}