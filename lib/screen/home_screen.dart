import 'package:anand_shop_app/model/user_model.dart';
import 'package:anand_shop_app/provider/user_provider.dart';
import 'package:anand_shop_app/routes/route_name.dart';
import 'package:anand_shop_app/utils/colors.dart';
import 'package:anand_shop_app/utils/common_function.dart';
import 'package:anand_shop_app/widget/common_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/auth_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel userModel = ref.watch(userProvider);
    return WillPopScope(
      onWillPop: () async {
        exitPopUp(context, "Exit App", "Do you want to exit an App?", () {
          Navigator.of(context).pop(true);
        });
        return false;
      },
      child: Scaffold(
        backgroundColor: whiteSnowBgClr,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text(
                text: "Welcome",
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              text(
                text: userModel.name,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
