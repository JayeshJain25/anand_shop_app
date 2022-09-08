import 'package:flutter_riverpod/flutter_riverpod.dart';

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
