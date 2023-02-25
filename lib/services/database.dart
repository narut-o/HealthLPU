import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthy/model/customuser.dart';

class DatabaseService {
  String uid;
  DatabaseService({required this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String name, String sugars, int strength) async {
    print('userID - $uid');
    return await brewCollection
        .doc(uid)
        .set({'name': name, 'sugars': sugars, 'strength': strength});
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.get('name'),
        sugars: snapshot.get('sugars'),
        strength: snapshot.get('strenght'));
  }

  // List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((e) {
  //     return Brew(
  //         name: e.get('name'),
  //         sugars: e.get('sugars'),
  //         strength: e.get('strength'));
  //   }).toList();
  // }

  // Stream<List<Brew>> get brews {
  //   return brewCollection.snapshots().map(_brewListFromSnapshot);
  // }

  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map((document) {
      return UserData(
          uid: uid,
          name: document.get('name'),
          sugars: document.get('sugars'),
          strength: document.get('strength'));
    });
  }
}
