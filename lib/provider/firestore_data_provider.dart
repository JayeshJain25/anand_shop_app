import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/sub_product_model.dart';

final firestoreDataProvider = Provider<FirestoreDataProvider>((ref) {
  return FirestoreDataProvider(ref: ref.read);
});

class FirestoreDataProvider {
  FirestoreDataProvider({required this.ref});

  final Reader ref;

  Future<List<SubProductModel>> getData(String categoryId) async {
    List<SubProductModel> list = [];

    await FirebaseFirestore.instance
        .collection('product')
        .doc(categoryId)
        .collection("subcategory")
        .get()
        .then((event) async {
      final docs1 = event.docs;
      for (var data in docs1) {
        await FirebaseFirestore.instance
            .collection('product')
            .doc(categoryId)
            .collection("subcategory")
            .doc(
              data.data()["id"].toString().trim(),
            )
            .collection("subcategory2")
            .get()
            .then((event) {
          final docs = event.docs;
          for (var data1 in docs) {
            list.add(
              SubProductModel(
                title: data1.data()["title"],
                id: data1.data()["id"],
                image: data1.data()["image"],
              ),
            );
          }
        });
      }
    });
    return list;
  }

  Future<String> getSubCategory3List(
    String categoryId,
    String subProductId,
  ) async {
    String productIdValue = "";
    await FirebaseFirestore.instance
        .collection('product')
        .doc(categoryId)
        .collection("subcategory")
        .get()
        .then((value) async {
      final docs1 = value.docs;
      for (var data in docs1) {
        await FirebaseFirestore.instance
            .collection('product')
            .doc(categoryId)
            .collection("subcategory")
            .doc(
              data.data()["id"].toString().trim(),
            )
            .collection("subcategory2")
            .get()
            .then((value1) {
          final docs = value1.docs;
          for (var data1 in docs) {
            if (data1.data()["id"].toString().trim() == subProductId) {
              productIdValue = data.data()["id"].toString().trim();
            }
          }
        });
      }
    });

    return productIdValue;
  }
}
