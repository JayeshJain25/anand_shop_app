import 'package:anand_shop_app/model/sub_product_model.dart';
import 'package:anand_shop_app/provider/product_provider.dart';
import 'package:anand_shop_app/utils/colors.dart';
import 'package:anand_shop_app/widget/common_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    int subCategorySelectedIndex = ref.watch(subCategorySelectedIndexProvider);
    Map<String, String> mainCategory = ref.watch(mainCategoryProvider);
    String subCategoryTitle = ref.watch(subCategoryTitleProvider);
    String subCategoryDocId = ref.watch(subCategoryDocIdProvider);

    return Scaffold(
      backgroundColor: whiteSnowBgClr,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteSnowBgClr,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (() => Navigator.of(context).pop()),
              child: const Icon(
                Iconsax.arrow_left4,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(
                  text: mainCategory["name"] ?? "",
                  color: blackShadeTextClr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),
                text(
                  text: subCategoryTitle,
                  color: Colors.black54,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('product')
                .doc(mainCategory["id"]!.trim())
                .collection("subcategory")
                .snapshots(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: text(
                    text: "Product Not Available",
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                );
              } else {
                return SizedBox(
                  height: 0.2.sh,
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length + 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            ref.read(subCategoryTitleProvider.notifier).change(
                                  index == 0
                                      ? ""
                                      : snapshot.data!.docs[index - 1]["title"],
                                );
                            ref.read(subCategoryDocIdProvider.notifier).change(
                                  index == 0
                                      ? ""
                                      : snapshot.data!.docs[index - 1]["id"],
                                );
                            ref
                                .read(subCategorySelectedIndexProvider.notifier)
                                .change(index);
                          },
                          child: index == 0
                              ? Container(
                                  width: 120.w,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    color: subCategorySelectedIndex == index
                                        ? primaryColor
                                        : Colors.white,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: text(
                                      text: "ALL",
                                      color: subCategorySelectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 120.w,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 7,
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          imageUrl: snapshot
                                              .data!.docs[index - 1]["image"],
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
                                            color: subCategorySelectedIndex ==
                                                    index
                                                ? primaryColor
                                                : Colors.black38,
                                            child: Center(
                                              child: text(
                                                color:
                                                    subCategorySelectedIndex ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.normal,
                                                text: snapshot.data!
                                                    .docs[index - 1]["title"],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        );
                      })),
                );
              }
            }),
          ),
          subCategorySelectedIndex == 0
              ? FutureBuilder<List<SubProductModel>>(
                  future: getData(ref.read(mainCategoryProvider)["id"]!.trim()),
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox(
                        height: 0.8.sh,
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (ctx, index) {
                              return Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 100.h,
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: snapshot.data![index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          text(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.normal,
                                            text:
                                                "Name:  ${snapshot.data![index].title}",
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ));
                            }),
                      );
                    }
                  })
              : StreamBuilder<QuerySnapshot>(
                  stream: subCategorySelectedIndex == 0
                      ? FirebaseFirestore.instance
                          .collection('product')
                          .doc(mainCategory["id"]!.trim())
                          .collection("subcategory")
                          .doc("lrE5aTF2X2XdZUTrKUC5")
                          .collection("subcategory2")
                          .snapshots()
                      : FirebaseFirestore.instance
                          .collection('product')
                          .doc(mainCategory["id"]!.trim())
                          .collection("subcategory")
                          .doc(subCategoryDocId.trim())
                          .collection("subcategory2")
                          .snapshots(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: text(
                          text: "Product Not Available",
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    } else {
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: text(
                            text: "Product Not Available",
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }
                      return SizedBox(
                        height: 0.8.sh,
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 100.h,
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: snapshot.data!.docs[index]
                                              ["image"],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          text(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.normal,
                                            text:
                                                "Name:  ${snapshot.data!.docs[index]["title"]}",
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ));
                            })),
                      );
                    }
                  }))
        ],
      )),
    );
  }
}
