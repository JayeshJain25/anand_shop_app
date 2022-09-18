import 'package:anand_shop_app/model/sub_product_model.dart';
import 'package:anand_shop_app/provider/product_provider.dart';
import 'package:anand_shop_app/widget/common_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/colors.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, String> mainCategory = ref.watch(mainCategoryProvider);
    String subCategoryDocId = ref.watch(subCategoryDocIdProvider);
    SubProductModel productModel = ref.watch(subCategoryProvider);

    return Scaffold(
      backgroundColor: whiteSnowBgClr,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteSnowBgClr,
        leading: InkWell(
          onTap: (() => Navigator.of(context).pop()),
          child: const Icon(
            Iconsax.arrow_left4,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 10,
        ),
        child: textBtn(
          bgClr: primaryColor,
          color: Colors.white,
          text: "Inquiry Now",
          function: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: CachedNetworkImage(
                  imageUrl: productModel.image,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15.h,
              ),
            ),
            SliverToBoxAdapter(
              child: text(
                text: productModel.title,
                color: blackShadeTextClr,
                fontSize: 22.sp,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.left,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: 1.sw,
                height: 55.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    text(
                      text: "Detail",
                      color: blackShadeTextClr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    const VerticalDivider(
                      color: primaryColor,
                      thickness: 2.2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    text(
                      text: "Box Qty",
                      color: blackShadeTextClr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('product')
                    .doc(mainCategory["id"]!.trim())
                    .collection("subcategory")
                    .doc(subCategoryDocId.trim())
                    .collection("subcategory2")
                    .doc(productModel.id.trim())
                    .collection("subcateogry3")
                    .snapshots(),
                builder: (
                  context,
                  snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SliverToBoxAdapter(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        text(
                                          text: snapshot.data!.docs[index]
                                              ["title"],
                                          color: blackShadeTextClr,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        text(
                                          text: snapshot.data!.docs[index]
                                              ["code"],
                                          color: blackShadeTextClr,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        text(
                                          text:
                                              "Qty -${snapshot.data!.docs[index]["quantity"]} (In box)",
                                          color: blackShadeTextClr,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      height: 80.h,
                                      child: CupertinoSpinBox(
                                        min: 1,
                                        max: 100,
                                        value: 1,
                                        onChanged: (value) {},
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(
                                  color: blackShadeTextClr,
                                  thickness: 2,
                                ),
                              ],
                            );
                          },
                          childCount: snapshot.data!.docs.length,
                        ),
                      );
                    } else {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: text(
                            text: "Product Not Available",
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
