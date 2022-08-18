import 'package:anand_shop_app/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _user;

  Future<UserModel> getUser(String uid) async {
    UserModel user =
        UserModel(uid: "", name: "", phoneNumber: "", email: "", role: "");
    _user = _firestore.collection('user');
    try {
      await _user.doc(uid).get().then((value) {
        final data = value.data() as Map<String, dynamic>;
        user = UserModel(
          uid: uid,
          name: data["name"].toString(),
          phoneNumber: data["phoneNumber"].toString(),
          email: data["email"].toString(),
          role: data["role"].toString(),
        );
        return value.data();
      });
    } catch (e) {
      return Future.error(e); // return error
    }
    return user;
  }

  Future<bool> addUser(UserModel user) async {
    _user = _firestore.collection('user');
    try {
      await _user.doc(user.uid).set({
        'uid': user.uid,
        'name': user.name,
        'phoneNumber': user.phoneNumber,
        'email': user.email,
        'role': user.role,
      });
      return true;
    } catch (e) {
      return Future.error(e); // return error
    }
  }

  Future<bool> editUserData(UserModel user, String userId) async {
    _user = _firestore.collection('user');
    try {
      await _user
          .doc(userId)
          .update(// updates the movie document having id of moviedId
              {
        'uid': user.uid,
        'name': user.name,
        'phoneNumber': user.phoneNumber,
        'email': user.email,
        'role': user.role,
      });
      return true; //// return true after successful updation .
    } catch (e) {
      print(e.toString());
      return Future.error(e); //return error
    }
  }
}

// Creating a simple Riverpod provider that provides an instance of our Database class so that it can be used from our UI(by calling Database class methods)
final databaseProvider = Provider((ref) => DatabaseProvider());
