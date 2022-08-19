import 'package:anand_shop_app/utils/colors.dart';
import 'package:anand_shop_app/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../provider/auth_provider.dart';
import '../../routes/route_name.dart';
import '../../utils/common_function.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authenticationProvider);
    return WillPopScope(
      onWillPop: () async {
        exitPopUp(context, "Exit App", "Do you want to exit an App?", () {
          Navigator.of(context).pop(true);
        });
        return false;
      },
      child: Scaffold(
        backgroundColor: whiteSnowBgClr,
        body: LayoutBuilder(builder: (_, constraints) {
          final width = constraints.biggest.width;
          final height = constraints.biggest.height;
          return Column(
            children: [
              SizedBox(
                height: 0.2.sh,
                child: Stack(
                  children: [
                    Container(
                      width: 1.sw,
                      height: 0.15.sh,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.02,
                      left: width * 0.105,
                      child: Container(
                        width: 0.8.sw,
                        height: 0.08.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF4e002c),
                        ),
                        child: Center(
                          child: text(
                            text: "Settings",
                            color: whiteSnowBgClr,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: width * 0.1,
                  right: width * 0.1,
                ),
                child: accountDashboardTItle(
                  icon: Iconsax.user,
                  function: () {
                    moveToNextScreen(context, RouteName.profileScreen);
                  },
                  textV: "Profile",
                ),
              ),
              divider(),
              Container(
                margin: EdgeInsets.only(
                  left: width * 0.1,
                  right: width * 0.1,
                ),
                child: accountDashboardTItle(
                  icon: Iconsax.logout,
                  function: () {
                    exitPopUp(
                        context, "Logout", "Do you want to log out of an app?",
                        () {
                      auth.signOut().then(
                            (value) => moveToNextScreen(
                              context,
                              RouteName.selectUser,
                            ),
                          );
                    });
                  },
                  textV: "Logout",
                ),
              ),
              divider(),
            ],
          );
        }),
      ),
    );
  }
}
