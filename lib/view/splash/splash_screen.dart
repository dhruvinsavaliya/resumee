import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumee/config/app_colors.dart';
import 'package:resumee/config/image_path.dart';
import 'package:resumee/config/text_style.dart';
import 'package:resumee/view/bottom_bar/bottom_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      // () => Get.offAll(
      //   () => isLogin != null ? const BottomBarScreen() : const MobileNumberScreen(),
      // ),
      () => Get.offAll(
        // () => LoginScreen(),
        () => const BottomBarScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      body: Container(
        color: AppColors.whiteColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              " Resume Builder ",
              style: AppTextStyle.regular600.copyWith(
                  fontSize: 26, color: AppColors.blackColor, letterSpacing: 1),
            )
          ],
        ),
      ),
    );
  }
}
