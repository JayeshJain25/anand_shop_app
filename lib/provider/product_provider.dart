import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/sub_product_model.dart';

final mainCategoryProvider =
    StateNotifierProvider<MainCategoryProvider, Map<String, String>>(
  (ref) => MainCategoryProvider(),
);

class MainCategoryProvider extends StateNotifier<Map<String, String>> {
  MainCategoryProvider() : super({"name": "none", "id": "0"});

  void change(Map<String, String> value) => state = value;
}

final subCategorySelectedIndexProvider =
    StateNotifierProvider<SubCategorySelectedIndexProvider, int>(
  (ref) => SubCategorySelectedIndexProvider(),
);

class SubCategorySelectedIndexProvider extends StateNotifier<int> {
  SubCategorySelectedIndexProvider() : super(0);

  void change(int value) => state = value;
}

final subCategoryTitleProvider =
    StateNotifierProvider<SubCategoryTitleProvider, String>(
  (ref) => SubCategoryTitleProvider(),
);

class SubCategoryTitleProvider extends StateNotifier<String> {
  SubCategoryTitleProvider() : super("");

  void change(String value) => state = value;
}

final subCategoryDocIdProvider =
    StateNotifierProvider<SubCategoryDocIdProvider, String>(
  (ref) => SubCategoryDocIdProvider(),
);

class SubCategoryDocIdProvider extends StateNotifier<String> {
  SubCategoryDocIdProvider() : super("");

  void change(String value) => state = value;
}

final subCategoryListProvider =
    StateNotifierProvider<SubCategoryListProvider, List<SubProductModel>>(
  (ref) => SubCategoryListProvider(),
);

class SubCategoryListProvider extends StateNotifier<List<SubProductModel>> {
  SubCategoryListProvider() : super([]);

  void change(List<SubProductModel> value) => state = value;
}

Future<List<SubProductModel>> getData(String categoryId) async {
  List<SubProductModel> list = [];
  FirebaseFirestore.instance
      .collection('product')
      .doc(categoryId)
      .collection("subcategory")
      .get()
      .then((event) {
    final docs1 = event.docs;
    for (var data in docs1) {
      FirebaseFirestore.instance
          .collection('product')
          .doc(categoryId)
          .collection("subcategory")
          .doc(data.data()["id"].toString().trim())
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
    print(list);
  });

  return list;
}
