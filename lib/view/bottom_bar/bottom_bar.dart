import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:resumee/config/app_colors.dart';
import 'package:resumee/config/image_path.dart';
import 'package:resumee/controller/home_controller.dart';
import 'package:resumee/view/home_screen/home_screen.dart';
import 'package:resumee/view/profile_screen/profile_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  HomeController homeController = Get.put(HomeController());

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      body: Obx(
            () => homeController.selectedBottomIndex.value == 0
            ? const HomeScreen()
            : homeController.selectedBottomIndex.value == 1
            ? const ProfileScreen()
            :const SizedBox(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 23, bottom: 19, left: 24, right: 24),
            child: GNav(
              // rippleColor: Colors.grey[300]!,
              // hoverColor: Colors.grey[100]!,
              // gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: AppColors.primary,
              color: Colors.black,
              // ta
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  leading: SizedBox(
                    width:homeController.selectedBottomIndex.value == 1 ?Get.width*0.25: Get.width*0.45,
                    child: Image.asset(
                      ImagePath.homeIcon,
                      height: 19,
                      width: 17,
                      color: homeController.selectedBottomIndex.value == 0
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                GButton(
                  icon: Icons.person_outlined,
                  leading: SizedBox(
                    width:homeController.selectedBottomIndex.value == 0 ?Get.width*0.25: Get.width*0.45,
                    child: Image.asset(
                      ImagePath.profileIcon,
                      height: 19,
                      width: 17,
                      color: homeController.selectedBottomIndex.value == 1
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
              selectedIndex: homeController.selectedBottomIndex.value,
              onTabChange: (index) {
                setState(() {
                  homeController.selectedBottomIndex.value = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
