import 'package:anand_shop_app/model/user_model.dart';
import 'package:anand_shop_app/provider/user_provider.dart';
import 'package:anand_shop_app/routes/route_name.dart';
import 'package:anand_shop_app/utils/colors.dart';
import 'package:anand_shop_app/utils/common_function.dart';
import 'package:anand_shop_app/widget/common_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: whiteSnowBgClr,
          body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('product').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return text(
                  text: "Product Not Available",
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                );
              }
              print(snapshot.data!.docs.first["image"]);
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 25,
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data!.docs[index]["image"],
                              height: 170.h,
                              width: 1.sw,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 1.sw,
                                height: 30.h,
                                color: Colors.black38,
                                child: Center(
                                  child: text(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    text: snapshot.data!.docs[index]
                                        ["category"],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
