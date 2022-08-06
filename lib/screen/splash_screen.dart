import 'dart:async';

import 'package:anand_shop_app/routes/route_name.dart';
import 'package:anand_shop_app/utils/common_function.dart';
import 'package:anand_shop_app/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => moveToNextScreen(
        context,
        RouteName.selectUser,
      ),
    );
    super.initState();
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
                color: const Color(0xFFFD673A),
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
            color: Color(0xFFFD673A),
          )
        ],
      ),
    );
  }
}
