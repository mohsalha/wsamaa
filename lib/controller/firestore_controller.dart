import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wsamaa_project/models/add_essay.dart';
import 'package:wsamaa_project/models/request_essay.dart';

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

  Future<bool> requestEssay(RequestEssay request) async {
    DocumentReference _documentReference =
    await _firestore.collection('requestEssay').add(request.toMap());
    return true;
  }


}