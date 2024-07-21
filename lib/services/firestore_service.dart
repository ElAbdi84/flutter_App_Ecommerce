import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    var snapshots = await _db.collection('products').get();
    return snapshots.docs.map((doc) => Product(
      id: doc.id,
      name: doc['name'],
      description: doc['description'],
      price: doc['price'],
      imageUrl: doc['imageUrl'],
    )).toList();
  }
}
