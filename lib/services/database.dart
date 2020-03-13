import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppinglist/models/product.dart';
import 'package:shoppinglist/models/shop.dart';

class DatabaseService {
  final CollectionReference shopsCollection =
      Firestore.instance.collection('shops');

  final CollectionReference productsCollection =
  Firestore.instance.collection('products');

  Future setNewShop(String name) async {
    await shopsCollection.add(<String, dynamic>{'name': name});
  }

  // get shops stream
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

  // get products stream
  Stream<List<Product>> get products =>
      productsCollection.snapshots().map(_productListFromSnapshot);

  // product list from snapshot
  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Product(
        name: doc.data['name'] ?? '',
        shop: doc.data['shop'] ?? '',
        number: doc.data['number'] ?? 0,
      );
    }).toList();
  }
}
