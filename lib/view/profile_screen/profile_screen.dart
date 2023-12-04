import 'package:flutter/material.dart';
import 'package:resumee/config/image_path.dart';
import 'package:resumee/widget/common_appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            title: "Profile",
          ),
        ],
      ),
    ));
  }

}
