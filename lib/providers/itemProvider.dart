import 'package:cloud_firestore/cloud_firestore.dart';

class ItemProvider{

  Firestore _firestore = Firestore.instance;
  
  createList(idDocument,data) async {
      try {
        var res = _firestore.collection('lists').document(idDocument).collection('items').add(data).then((value) => value.documentID);
        return {
          'ok' : true,
          'data' : res,
        };
      } catch (e) {
        print(e);
      }
  }
}