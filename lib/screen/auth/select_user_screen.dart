import 'package:anand_shop_app/provider/login_provider.dart';
import 'package:anand_shop_app/routes/route_name.dart';
import 'package:anand_shop_app/utils/common_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../widget/common_widget.dart';

class SelectUserScreen extends ConsumerWidget {
  const SelectUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        exitPopUp(context, "Exit App", "Do you want to exit an App?", () {
          Navigator.of(context).pop(true);
        });
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(
          0xFF18191B,
        ),
        body: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                authBg,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(
                      text: "Welcome",
                      color: blackShadeTextClr,
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textBtnWithIcon(
                      bgClr: Colors.white,
                      color: primaryColor,
                      radius: 25,
                      fontSize: 14.sp,
                      width: 0.7.sw,
                      fontWeight: FontWeight.w500,
                      size: 35.h,
                      primaryClr: primaryColor,
                      text: "Retailer Login",
                      borderWidth: 1,
                      function: () {
                        ref.read(userRoleProvider.notifier).change("Retailer");
                        moveToNextScreen(context, RouteName.signIn);
                      },
                      iconV: Iconsax.house_2,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    textBtnWithIcon(
                      bgClr: Colors.white,
                      color: primaryColor,
                      radius: 25,
                      fontSize: 14.sp,
                      width: 0.7.sw,
                      fontWeight: FontWeight.w500,
                      size: 35.h,
                      primaryClr: primaryColor,
                      text: "Customer Login",
                      borderWidth: 1,
                      function: () {
                        ref.read(userRoleProvider.notifier).change("customer");
                        moveToNextScreen(context, RouteName.signIn);
                      },
                      iconV: Iconsax.user_square,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
