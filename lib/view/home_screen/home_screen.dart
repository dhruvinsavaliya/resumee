// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:resumee/config/app_colors.dart';
import 'package:resumee/config/image_path.dart';
import 'package:resumee/config/text_style.dart';
import 'package:resumee/widget/common_appbar.dart';

final ZoomDrawerController z = ZoomDrawerController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonAppBar(
              leftImage: ImagePath.menuIcon,
              leftIconSize: 24,
              rightIconSize: 24,
              rightImage: ImagePath.personOutline,
              title: "Home",
            ),
            ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  // height: 100,
                  padding: const EdgeInsets.only(
                      left: 5, top: 15, bottom: 7, right: 14),
                  margin: const EdgeInsets.only(
                      left: 18, right: 18, top: 5, bottom: 15),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: AppColors.shadowColor,
                            spreadRadius: -1,
                            blurRadius: 5),
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.width * 0.30,
                        width: Get.width * 0.28,
                        // color: AppColors.primary,
                        margin: const EdgeInsets.only(
                          right: 8,
                        ),
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: Image.asset(ImagePath.cock),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arla DANO Full Cream Milk Powder Instant",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.regular600.copyWith(
                                  fontSize: 16,
                                  color: AppColors.blackHomeTitle),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "4.5",
                                  style: AppTextStyle.regular500
                                      .copyWith(fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                RatingBar.builder(
                                  initialRating: 0.0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: AppColors.orange,
                                  ),
                                  onRatingUpdate: (rating) {
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                            Text(
                              "(89 reviews)",
                              style: AppTextStyle.regular500.copyWith(
                                  fontSize: 10, color: AppColors.oldSilver),
                            ),
                            Row(
                              children: [
                                Text(
                                  "₹540.00",
                                  style: AppTextStyle.regular700.copyWith(
                                      fontSize: 14,
                                      color:
                                          AppColors.primary.withOpacity(0.8)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "MRP: ₹840",
                                  style: AppTextStyle.regular400.copyWith(
                                      fontSize: 9,
                                      color: AppColors.blackColor
                                          .withOpacity(0.9)),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, right: 16, left: 16),
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.shopping_bag_outlined,
                                        color: AppColors.primaryDrawerShadow2,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 11,
                                      ),
                                      Text(
                                        "Add",
                                        style: AppTextStyle.regular600.copyWith(
                                            color:
                                                AppColors.primaryDrawerShadow2),
                                      )
                                    ],
                                  ),
                                ),
                                // commonButton(
                                //     title: "Add ",
                                //     icon: Icons.shopping_bag_outlined)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
