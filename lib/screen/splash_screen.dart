import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routes/route_name.dart';
import '../utils/colors.dart';
import '../utils/common_function.dart';
import '../widget/common_widget.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  displaySplash() {
    Timer(const Duration(seconds: 3), () async {
      if (user != null) {
        moveToNextScreen(context, RouteName.homeScreen);
      } else {
        moveToNextScreen(context, RouteName.selectUser);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF22232d),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFD673A),
              ),
            ),
            child: Center(
              child: text(
                text: "AN",
                color: primaryColor,
                fontSize: 55.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 100,
            ),
            child: text(
              text: "Anand Shop App",
              color: const Color(0xFFcacbd2),
              fontSize: 50.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const CircularProgressIndicator(
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
