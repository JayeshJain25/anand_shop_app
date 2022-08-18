import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRoleProvider = StateNotifierProvider<UserRole, String>(
  (ref) => UserRole(),
);

class UserRole extends StateNotifier<String> {
  UserRole() : super('none');

  void change(String text) => state = text;
}

final loginLoadingProvider = StateNotifierProvider<LoginLoadingProvider, bool>(
  (ref) => LoginLoadingProvider(),
);

class LoginLoadingProvider extends StateNotifier<bool> {
  LoginLoadingProvider() : super(false);

  void change(bool value) => state = value;
}

final signUpLoadingProvider =
    StateNotifierProvider<SignUpLoadingProvider, bool>(
  (ref) => SignUpLoadingProvider(),
);

class SignUpLoadingProvider extends StateNotifier<bool> {
  SignUpLoadingProvider() : super(false);

  void change(bool value) => state = value;
}
