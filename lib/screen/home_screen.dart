import 'package:anand_shop_app/widget/common_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return WillPopScope(
      onWillPop: () async {
        exitPopUp(context);
        return false;
      },
      child: Scaffold(
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
                text: user!.email ?? "",
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
