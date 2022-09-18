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

final subCategoryProvider =
    StateNotifierProvider<SubCategoryProvider, SubProductModel>(
  (ref) => SubCategoryProvider(),
);

class SubCategoryProvider extends StateNotifier<SubProductModel> {
  SubCategoryProvider()
      : super(
          SubProductModel(id: "", image: "", title: ""),
        );

  void change(SubProductModel value) => state = value;
}
