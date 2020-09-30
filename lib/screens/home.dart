import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Color(0xffff1654),
      body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('https://beat1009.com.mx/system/storage/serve/25311/daft-punk-beat1009.jpg'),
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('¡Buenas noches!', style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                          Text('Alejandro González', style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          )),
                        ],
                      )
                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10
                  ),
                  child: Text('Que haremos hoy?', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
                ),
                buttonOptions(context),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10
                  ),
                  child: Text('Tus listas.', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  )),
                ),
                
                listItems(),
                
              ],
            ),
          ),
      )
    );
  }

  Widget buttonOptions(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10
      ),
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: ()=>Navigator.pushNamed(context, 'list'),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Text('Crear Lista'),
              ),
            ),
            GestureDetector(
              onTap: ()=>Navigator.pushNamed(context, 'code'),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Text('Entrar a una lista'),
              ),
            )
          ],
        ),
    );
  }
  Widget listItems(){
    return StreamBuilder(
      stream: Firestore.instance.collection('lists').where('email', isEqualTo: 'alexgve7@gmail.com').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasData){
          return Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20
                ),
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