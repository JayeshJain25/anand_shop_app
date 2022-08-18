import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';

final userProvider = StateNotifierProvider<UserProvider, UserModel>(
  (ref) => UserProvider(),
);

class UserProvider extends StateNotifier<UserModel> {
  UserProvider()
      : super(
          UserModel(
            name: "",
            role: "",
            phoneNumber: "",
            uid: "",
            email: "",
          ),
        );

  void changeData(UserModel userModel) => state = userModel;
}
