
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dakblog/models/user.dart';

class DatabaseService {
  DatabaseService({this.uid});

  final String uid;

  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String fullname, String email, DateTime dateTime) async {
    try {
      return await userCollection
          .document(uid)
          .setData({'fullname': fullname, 'email': email, 'registered_date': dateTime});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // get user data from a snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      userID: uid,
      fullname: snapshot.data['fullname'],
      email: snapshot.data['email'],
    );
  }

  // get user data
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
  
  // update account info
  Future updateAccountInfo(String fullname) async {
    try {
      return await userCollection
          .document(uid)
          .updateData({'fullname': fullname});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  // user doc from a snapshot
  // List<UserData> _userDocumentFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return UserData(
  //       fullname: doc.data['fullname'] ?? '',
  //       email: doc.data['email'] ?? '',
  //     );
  //   }).toList();
  // }

  // get user stream
  // Stream<List<UserData>> get user {
  //   return userCollection.snapshots().map(_userDocumentFromSnapshot);
  // }
  
}
