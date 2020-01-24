import 'package:dakblog/models/user.dart';
import 'package:dakblog/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //obj of user class asigned to firebaseAuth user
  User _userFromFirebaseConsole(FirebaseUser user){
      return user != null ? User(userID: user.uid) : null;
  }

  //auth listen to stream and get logged in user
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebaseConsole);
  }

  //user email/pass login
  Future loginWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseConsole(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //user email/pass register
  Future registerWithEmailAndPassword(String email, String password, String fullname) async{
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      var dateTime = new DateTime.now();
      // create a new document for the user with the UID
      await DatabaseService(uid: user.uid).updateUserData(fullname, email, dateTime);
      return _userFromFirebaseConsole(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // user signout
  Future signoutUser() async{
    try{
      return await _firebaseAuth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}
