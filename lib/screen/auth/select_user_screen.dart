import 'package:anand_shop_app/utils/constants.dart';
import 'package:anand_shop_app/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SelectUserScreen extends StatelessWidget {
  const SelectUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF18191B,
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              background,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            text(
              text: "Welcome",
              color: const Color(0xFFcacbd2),
              fontSize: 50.sp,
              fontWeight: FontWeight.w400,
            ),
            GlassmorphicContainer(
              width: 0.85.sw,
              height: 0.3.sh,
              borderRadius: 25,
              blur: 7,
              alignment: Alignment.topCenter,
              border: 0,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFD673A).withAlpha(55),
                  const Color(0xFFffffff).withAlpha(45),
                ],
                stops: const [
                  0.3,
                  1,
                ],
              ),
              borderGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    const Color(0xFF4579C5).withAlpha(100),
                    const Color(0x0fffffff).withAlpha(55),
                    const Color(0xFFFD673A).withAlpha(10),
                  ],
                  stops: const [
                    0.06,
                    0.95,
                    1
                  ]),
              child: Column(
                children: [
                  textBtn(
                              bgClr: Colors.white,
                              color: primaryColor,
                              radius: 25,
                              fontSize: 11.sp,
                              width: 145,
                              fontWeight: FontWeight.normal,
                              size: 35.h,
                              primaryClr: primaryColor,
                              text: "Cancel Booking",
                              borderWidth: 2,
                              function: btnFunction,
                            )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
