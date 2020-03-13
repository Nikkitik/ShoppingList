import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppinglist/models/shop.dart';

class DatabaseService {
  final CollectionReference shopsCollection =
      Firestore.instance.collection('shops');

  Future setNewShop(String name) async {
    await shopsCollection.add(<String, dynamic>{'name': name});
  }

  // get categories stream
  Stream<List<Shop>> get shops =>
      shopsCollection.orderBy('name').snapshots().map(_shopListFromSnapshot);

  // category list from snapshot
  List<Shop> _shopListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Shop(
        name: doc.data['name'] ?? '',
      );
    }).toList();
  }
}
