// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumee/config/app_colors.dart';
import 'package:resumee/config/image_path.dart';
import 'package:resumee/config/text_style.dart';
import 'package:resumee/view/create_resume/create_resume_screen.dart';
import 'package:resumee/widget/common_appbar.dart';


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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=>const CreateResumeScreen());
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
