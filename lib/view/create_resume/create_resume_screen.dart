import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:resumee/config/app_colors.dart';
import 'package:resumee/config/image_path.dart';
import 'package:resumee/config/text_style.dart';
import 'package:resumee/widget/common_appbar.dart';

class CreateResumeScreen extends StatefulWidget {
  const CreateResumeScreen({Key? key}) : super(key: key);

  @override
  State<CreateResumeScreen> createState() => _CreateResumeScreenState();
}

class _CreateResumeScreenState extends State<CreateResumeScreen> {
  String loremIpsum =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.spanishGray,
        body: SingleChildScrollView(
          child: Column(
            children: [
              commonAppBar(
                leftIcon: Icons.arrow_back_rounded,
                leftOnTap: () => Get.back(),
                leftPadding: const EdgeInsets.only(left: 0),
                leftIconSize: 24,
                rightIconSize: 24,
                rightIcon: Icons.preview,

                // rightImage: ImagePath.personOutline,
                title: "",
              ),
              const SizedBox(height: 15),
              Container(
                width: Get.width * 0.95,
                decoration: const BoxDecoration(color: AppColors.whiteColor),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            "JONATHAN PATTRSON",
                            style: AppTextStyle.regular600.copyWith(
                                color: AppColors.blueColor, fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "FLUTTER DEVELOPER",
                                style: AppTextStyle.regular600
                                    .copyWith(color: AppColors.blackColor.withOpacity(0.5)),
                              ),
                              const SizedBox(width: 40),
                              Expanded(
                                child: Divider(
                                  color: AppColors.blackColor.withOpacity(0.5),
                                  thickness: 1,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            height: Get.width * 1.5,
                            color: AppColors.whiteColor,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: Get.width * 0.3,
                                    width: Get.width,
                                    child: Image.asset(
                                      "assets/image/dhruvin.jpeg",
                                      fit: BoxFit.fitWidth,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 15),
                                      Text(
                                        "PERSONAL PROFILE",
                                        style: AppTextStyle.regular600
                                            .copyWith(color: Colors.blue),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        loremIpsum,
                                        style: AppTextStyle.regular300
                                            .copyWith(fontSize: 10),
                                      ),
                                      const SizedBox(height: 30),
                                      Text(
                                        "WORK EXPERIENCE",
                                        style: AppTextStyle.regular600
                                            .copyWith(color: Colors.blue),
                                      ),
                                      const SizedBox(height: 10),
                                      workExperience(),
                                      const SizedBox(height: 10),
                                      workExperience(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: Get.width * 1.5,
                            color: Colors.grey.withOpacity(0.2),
                            child: Column(
                              children: [
                                Container(
                                  height: Get.width * 0.3,
                                  width: Get.width,
                                  decoration: const BoxDecoration(
                                      color: AppColors.primaryDrawerShadow2),
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              CupertinoIcons.globe,
                                              size: 15,
                                            ),
                                            SizedBox(
                                                width: 100,
                                                child: Text(
                                                  " dhruvinwork25@gmail.com",
                                                  style: AppTextStyle.regular300
                                                      .copyWith(fontSize: 10),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.call,
                                              size: 15,
                                            ),
                                            SizedBox(
                                                width: 100,
                                                child: Text(
                                                  " 1234567890",
                                                  style: AppTextStyle.regular300
                                                      .copyWith(fontSize: 10),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    const SizedBox(height: 15),
                                    Text("EDUCATION",style: AppTextStyle.regular600.copyWith(color: Colors.blue),),
                                    const SizedBox(height: 10),
                                    educationDetails(),
                                    const SizedBox(height: 10),
                                    educationDetails(),
                                    const SizedBox(height: 10),
                                    educationDetails()

                                  ],
                                ),
                                const SizedBox(height: 30),
                                Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    Text("PERSONAL SKILLS",style: AppTextStyle.regular600.copyWith(fontSize: 12,color: Colors.blue),),
                                    const SizedBox(height: 13),
                                    skillsDetails(),
                                    const SizedBox(height: 13),
                                    skillsDetails(),
                                    const SizedBox(height: 13),
                                    skillsDetails()

                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Padding educationDetails() {
    return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "BMU",
                                          style: AppTextStyle.bold.copyWith(color: AppColors.blackColor,
                                          fontSize: 13),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "2010",
                                              style: AppTextStyle.regular300.copyWith(fontSize: 10),
                                            ),
                                            Text(
                                              "BCA",
                                              style: AppTextStyle.regular300.copyWith(fontSize: 10),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
  }
  Padding skillsDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Public Speaking",
            style: AppTextStyle.bold.copyWith(color: AppColors.blackColor,
                fontSize: 13),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "4.5 / 5",
                style: AppTextStyle.regular300.copyWith(fontSize: 10),
              ),
            ],
          )
        ],
      ),
    );
  }


  Column workExperience() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Flutter Developer",
              style: AppTextStyle.regular600.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "202-21",
              style: AppTextStyle.regular300
                  .copyWith(color: AppColors.blackColor, fontSize: 10),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          loremIpsum,
          style: AppTextStyle.regular300.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}
