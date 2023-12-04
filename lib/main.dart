import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumee/config/app_colors.dart';
import 'package:resumee/controller/home_controller.dart';

import 'view/profile_screen/profile_controller.dart';
import 'view/splash/splash_screen.dart';

void main() {
  Get.put(HomeController());
  Get.put(ProfileController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Grocery App",
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: AppColors.whiteColor,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
        ),
      ),
      // home: const OfferScreen(),
      home: const SplashScreen(),
    );
  }
}
