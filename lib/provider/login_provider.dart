import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRoleProvider = StateNotifierProvider<UserRole, String>(
  (ref) => UserRole(),
);

class UserRole extends StateNotifier<String> {
  UserRole() : super('none');

  void change(String text) => state = text;
}
