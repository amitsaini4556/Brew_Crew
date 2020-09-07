import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/brew.dart';

class DataBase {
  String uid;

  DataBase({ this.uid });

  final _brew = Firestore.instance.collection('brews');

  Future updateUserData(String sugar, String name, int strength) async {
    return await _brew.document(uid).setData({
      'sugar': sugar,
      'name': name,
      'strength': strength
    });
  }

  List<Brew>_brewFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((brew) {
      return Brew(
          name: brew.data['name'],
          sugars: brew.data['sugars'],
          strength: brew.data['strength']
      );
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return _brew.snapshots()
        .map(_brewFromSnapshot);
  }
}