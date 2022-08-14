import 'package:anand_shop_app/widget/common_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../provider/auth_provider.dart';
import '../../routes/route_name.dart';
import '../../utils/colors.dart';
import '../../utils/common_function.dart';
import '../../utils/constants.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneNumberController.dispose();
    emailController.dispose();
    passController.dispose();
    rePassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authenticationProvider);
    return Form(
      key: formKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(
            0xFF18191B,
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  authBg,
                  width: 1.sw,
                  height: 1.sh,
                  fit: BoxFit.cover,
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
                Positioned(
                  top: 65.h,
                  child: Container(
                    width: 1.sw,
                    height: 1.sh,
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
                          text: "Sign Up",
                          color: blackShadeTextClr,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        inputTextFieldWithIcon(
                          hintTxt: "John",
                          icon: const Icon(
                            Iconsax.user,
                            color: kTextFeildClr,
                          ),
                          labelTxt: "Name",
                          type: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        numberInputTextFieldWithIcon(
                          controller: phoneNumberController,
                          hintTxt: "1234567890",
                          labelTxt: "Phone Number",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        inputTextFieldWithIcon(
                          controller: emailController,
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
                          controller: passController,
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
                          height: 25,
                        ),
                        inputTextFieldWithIcon(
                          controller: rePassController,
                          hintTxt: "* * * * * * *",
                          icon: const Icon(
                            Iconsax.lock,
                            color: kTextFeildClr,
                          ),
                          labelTxt: "Confirm Password",
                          obscure: true,
                          type: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        textBtn(
                          bgClr: blackShadeTextClr,
                          function: () async {
                            final isValidForm =
                                formKey.currentState!.validate();
                            if (isValidForm) {
                              if (passController.text ==
                                  rePassController.text) {
                                await auth
                                    .signUpWithEmailAndPassword(
                                        emailController.text,
                                        passController.text,
                                        context)
                                    .whenComplete(() => moveToNextScreen(
                                        context, RouteName.homeScreen));
                              } else {
                                toast(text: "Password incorrect");
                              }
                            }
                          },
                          text: "Sign Up",
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an account? ',
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    moveToNextScreen(context, RouteName.signIn);
                                  },
                                text: 'Sign In',
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
