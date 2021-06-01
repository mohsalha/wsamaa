import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wsamaa_project/models/add_essay.dart';

class FirestoreController{

  FirestoreController._();

  static FirestoreController _instance =
  FirestoreController._();

  static FirestoreController get instance {
    return _instance;
  }

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*
  CRUD

  1) Creat
  2) Read
  3) Update
  4) Delete


   */

// TODO: ADD ESSAY CONTROLLER

  Future<bool> creat(AddEssay essay) async {
    DocumentReference _documentReference =
    await _firestore.collection('essay').add(essay.toMap());
    return true;
  }

  Future<List<AddEssay>> read() async {
    QuerySnapshot _querySnapshot = await _firestore.collection('essay').get();
    List<AddEssay> essay = [];
    _querySnapshot.docs.forEach((element) {
      essay.add(
        AddEssay(
          id: element.id,
          name: element.data()['name'],
          email: element.data()['email'],
          title: element.data()['title'],
          details: element.data()['details'],
        ),
      );
    });
    return essay;
  }


}