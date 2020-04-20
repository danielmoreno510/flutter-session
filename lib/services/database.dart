import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/models/listusers.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String firstname, String lastname, String phone, String gender) async {
    return await userCollection.document(uid).setData({
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'gender': gender
    });
  }

  List<ListUsers> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ListUsers(
        firstname: doc.data['firstname'] ?? '',
        lastname: doc.data['lastname'] ?? '',
        phone: doc.data['phone'] ?? '',
        gender: doc.data['gender'] ?? '',
      );
    }).toList();
  }

  Stream<List<ListUsers>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}
