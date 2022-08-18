import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider =
    StateNotifierProvider<BotttomNavigationProvider, int>(
  (ref) => BotttomNavigationProvider(),
);

class BotttomNavigationProvider extends StateNotifier<int> {
  BotttomNavigationProvider() : super(0);

  void change(int value) => state = value;
}
