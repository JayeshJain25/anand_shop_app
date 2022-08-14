import 'package:anand_shop_app/routes/route_name.dart';
import 'package:anand_shop_app/utils/common_function.dart';
import 'package:anand_shop_app/widget/common_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(
          0xFF18191B,
        ),
        body: SingleChildScrollView(
          child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.2.sh,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Iconsax.arrow_left_24,
                            size: 35,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 0.7654.sh,
                    width: 1.sw,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120),
                      ),
                      color: whiteSnowBgClr,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        text(
                          text: "Login",
                          color: blackShadeTextClr,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        inputTextFieldWithIcon(
                          hintTxt: "example@gmail.com",
                          icon: const Icon(
                            Iconsax.sms,
                            color: kTextFeildClr,
                          ),
                          labelTxt: "Email",
                          type: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        inputTextFieldWithIcon(
                          hintTxt: "* * * * * * *",
                          icon: const Icon(
                            Iconsax.lock,
                            color: kTextFeildClr,
                          ),
                          labelTxt: "Password",
                          obscure: true,
                          type: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        textBtn(
                          bgClr: blackShadeTextClr,
                          function: () {},
                          text: "Login",
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 0.1.sh,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don\'t have an account? ',
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    moveToNextScreen(context, RouteName.signUp);
                                  },
                                text: 'Sign Up',
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
