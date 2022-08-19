import 'package:anand_shop_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../model/user_model.dart';
import '../../provider/database_provider.dart';
import '../../provider/login_provider.dart';
import '../../provider/user_provider.dart';
import '../../routes/route_name.dart';
import '../../utils/common_function.dart';
import '../../utils/constants.dart';
import '../../widget/common_widget.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final user = ref.read(userProvider);
    nameController.text = user.name;
    emailController.text = user.email;
    phoneNumberController.text = user.phoneNumber.split("+91")[1];
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    emailController.dispose();

    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final response = ref.watch(databaseProvider);
    final user = ref.watch(userProvider);
    bool value = ref.watch(updateProfileLoadingProvider);
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
                          text: "PROFILE",
                          color: blackShadeTextClr,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        inputTextFieldWithIcon(
                          controller: nameController,
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
                          readOnly: true,
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
                        loadingBtn(
                          value: value,
                          bgClr: blackShadeTextClr,
                          function: () async {
                            final isValidForm =
                                formKey.currentState!.validate();
                            if (isValidForm) {
                              ref
                                  .read(updateProfileLoadingProvider.notifier)
                                  .change(true);

                              UserModel userV = UserModel(
                                uid: user.uid,
                                name: nameController.text,
                                phoneNumber: "+91${phoneNumberController.text}",
                                email: emailController.text,
                                role: user.role,
                              );
                              response
                                  .editUserData(userV, user.uid)
                                  .then((value) {
                                if (value) {
                                  ref
                                      .read(userProvider.notifier)
                                      .changeData(userV);
                                  toast(text: "Profile successfully updated");
                                  moveToNextScreen(
                                      context, RouteName.bottomNavigation);
                                } else {
                                  toast(text: "There was an error.");
                                }
                              });

                              ref
                                  .read(updateProfileLoadingProvider.notifier)
                                  .change(false);
                            }
                          },
                          text: "Update",
                          color: Colors.white,
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
