import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketlist/providers/itemProvider.dart';
class ListDetail extends StatefulWidget {
  @override
  _ListDetailState createState() => _ListDetailState();
}

class _ListDetailState extends State<ListDetail> {
  final textProductController = TextEditingController();
  
  ItemProvider provider;
  var item;
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
              header(),
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

  Widget header(){
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      color: Colors.white,
      child: Theme(
        data: theme,
        child: ExpansionTile(
        title: Text('Ingrese un item a su lista', style: TextStyle(color: Color(0xffff1654))),
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(height: 15),
                    textInputItem(),
                    SizedBox(height: 10),
                    textArea(),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Color(0xffff1654),
                        textColor: Colors.white,
                        onPressed: ()=>addItem('JIpot5BHeycp5zfRwyKm'),
                        child: Text('Añadir'),
                      ),
                    )
                  ],
                ),
              ],
            ),
            )
          ],
        ),
      )
    );
  }

  Widget textInputItem(){
    return TextField(
      controller: textProductController,
      onChanged: (value){
        setState(() {
          item = value;
        });
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1,color: Color(0xffff1654)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.0),
        ),
        hintText: 'Item',
        prefixIcon: Icon(Icons.add_shopping_cart)
      ),
    );
  }
  Widget textArea(){
    return TextField(
      controller: textProductController,
      onChanged: (value){
        setState(() {
          item = value;
        });
      },
      maxLines: 3,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1,color: Color(0xffff1654)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.0),
        ),
        hintText: 'Item',
        prefixIcon: Icon(Icons.add_shopping_cart)
      ),
    );
  }

  Widget listItems(){
    return StreamBuilder(
      stream: Firestore.instance
      .collection('lists')
      .document('JIpot5BHeycp5zfRwyKm')
      .collection('items')
      .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasData){
          return Expanded(
              child: ListView(
                padding: EdgeInsets.all(20),
                children: snapshot.data.documents.map((DocumentSnapshot document){
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: 20
                    ),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffed577b)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(document['title'], 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                        Text(document['description'] != null ? document['description'] : 'No description', 
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
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


  void addItem(documentId) {
    var data = {
      'title' : item,
      'status' : false,
    };

    var res = provider.createList(documentId, data);
    if(res['ok']){
      print(res['data']);
    }
    else{
      print('fallo');
    }
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