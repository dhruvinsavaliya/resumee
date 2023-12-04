// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resumee/config/app_colors.dart';
import 'package:resumee/config/text_style.dart';
import 'package:resumee/widget/common_textfield.dart';
import 'package:share_plus/share_plus.dart';

import '../profile_screen/profile_controller.dart';


class CreateResumeScreen extends StatefulWidget {
  const CreateResumeScreen({Key? key}) : super(key: key);

  @override
  State<CreateResumeScreen> createState() => _CreateResumeScreenState();
}

class _CreateResumeScreenState extends State<CreateResumeScreen> {
final profileController = Get.find<ProfileController>();
  GlobalKey globalKey = GlobalKey();
  String loremIpsum =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.";
  final GlobalKey captureKey = GlobalKey();
  ui.Image? capturedImage;
File? selectedImage;
  @override
  void initState() {
    super.initState();
    setInitialData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.spanishGray,
        appBar:AppBar(leading: const BackButton(),
          backgroundColor: AppColors.primary,
          title: const Text("Resume"),
          actions: [
            IconButton(onPressed: () {
              saveImage();
            }, icon: const Icon(Icons.save)),
            IconButton(onPressed: () {
              shareImage();
            }, icon: const Icon(Icons.share))
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                RepaintBoundary(
                  key: globalKey,
                  child: Container(
                    width: Get.width * 0.95,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: AppColors.whiteColor),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              updateData(
                                widget: Text(
                                  profileController.titleController,
                                  style: AppTextStyle.regular600.copyWith(
                                      color: AppColors.blueColor, fontSize: 20),
                                ),
                                value: profileController.titleController,
                                  onValueChanged: (newValue) {
                        profileController.titleController = newValue;
                        },
                        ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  updateData(
                                      widget: Text(
                                        profileController.positionController,
                                        style: AppTextStyle.regular600
                                            .copyWith(color: AppColors.blackColor.withOpacity(0.5)),
                                      ),
                                      value: profileController.positionController
                                    ,
                                    onValueChanged: (newValue) {
                                      profileController.positionController = newValue;
                                    }, ),

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
                                    InkWell(
                                      onTap:() {
                              pickImage();
                                      },
                                      child: SizedBox(
                                          height: Get.width * 0.3,
                                          width: Get.width,
                                          child:   selectedImage != null
                                              ? Image.file(selectedImage!)
                                          : Image.asset(
                                            "assets/image/dhruvin.jpeg",
                                            fit: BoxFit.fitWidth,
                                          )),
                                    ),
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
                                          updateData(
                                              widget: Text(
                                                profileController.personDetsController,
                                                style: AppTextStyle.regular300
                                                    .copyWith(fontSize: 10),
                                              ),
                                              value: profileController.personDetsController
                                            ,
                                            onValueChanged: (newValue) {
                                              profileController.personDetsController = newValue;
                                            }, ),
                                          const SizedBox(height: 30),
                                          Text(
                                            "WORK EXPERIENCE",
                                            style: AppTextStyle.regular600
                                                .copyWith(color: Colors.blue),
                                          ),
                                          const SizedBox(height: 10),
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  updateData(
                                                    widget: Text(
                                          profileController.workExpTitle1Controller,
                                                      style: AppTextStyle.regular600.copyWith(
                                                          color: AppColors.blackColor,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    value:  profileController.workExpTitle1Controller,
                                                    onValueChanged: (newValue) {

                                                      profileController.workExpTitle1Controller= newValue;
                                                    },
                                                  ),
                                                  updateData(
                                                    widget: Text(
                                                      profileController.workExpYear1Controller,
                                                      style: AppTextStyle.regular300
                                                          .copyWith(color: AppColors.blackColor, fontSize: 10),
                                                    ),
                                                    value: profileController.workExpYear1Controller,
                                                    onValueChanged: (newValue) {
                                                      profileController.workExpYear1Controller = newValue;
                                                    },
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              updateData(
                                                widget: Text(
                                                  profileController.workExpDetails1Controller,
                                                  // loremIpsum,
                                                  style: AppTextStyle.regular300.copyWith(fontSize: 10),
                                                ),
                                                value: profileController.workExpDetails1Controller,
                                                onValueChanged: (newValue) {
                                                  // profileController.titleController = newValue;
                                                  profileController.workExpDetails1Controller = newValue;
                                                },
                                              ),
                                            ],
                                          ),
                                          // workExperience(title: profileController.workExpTitle1Controller,details: profileController.workExpDetails1Controller, year: profileController.workExpYear1Controller),
                                          const SizedBox(height: 10),
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  updateData(
                                                    widget: Text(
                                                      profileController.workExpTitle2Controller,
                                                      style: AppTextStyle.regular600.copyWith(
                                                          color: AppColors.blackColor,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    value:  profileController.workExpTitle2Controller,
                                                    onValueChanged: (newValue) {

                                                      profileController.workExpTitle1Controller= newValue;
                                                    },
                                                  ),
                                                  updateData(
                                                    widget: Text(
                                                      profileController.workExpYear2Controller,
                                                      style: AppTextStyle.regular300
                                                          .copyWith(color: AppColors.blackColor, fontSize: 10),
                                                    ),
                                                    value: profileController.workExpYear2Controller,
                                                    onValueChanged: (newValue) {
                                                      profileController.workExpYear2Controller = newValue;
                                                    },
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              updateData(
                                                widget: Text(
                                                  profileController.workExpDetails2Controller,
                                                  // loremIpsum,
                                                  style: AppTextStyle.regular300.copyWith(fontSize: 10),
                                                ),
                                                value: profileController.workExpDetails2Controller,
                                                onValueChanged: (newValue) {
                                                  // profileController.titleController = newValue;
                                                  profileController.workExpDetails2Controller = newValue;
                                                },
                                              ),
                                            ],
                                          ),

                                          // workExperience(title: profileController.workExpTitle2Controller,details: profileController.workExpDetails2Controller, year: profileController.workExpYear2Controller),
                                          // workExperience(),
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
                                                    child:
                                                    updateData(
                                                        widget: Text(
                                                          profileController.emailController,
                                                          style: AppTextStyle.regular300
                                                              .copyWith(fontSize: 10),
                                                        ),
                                                        value: profileController.emailController,
                                                      onValueChanged: (newValue) {
                                                        profileController.emailController = newValue;
                                                      },
                                                    ),
                                                    // child: Text(
                                                    //   " dhruvinwork25@gmail.com",
                                                    //   style: AppTextStyle.regular300
                                                    //       .copyWith(fontSize: 10),
                                                    // )
                                                ),
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
                                                   child: updateData(
                                                        widget: Text(
                                                          profileController.contactController,
                                                           style: AppTextStyle.regular300
                                                            .copyWith(fontSize: 10),
                                                        ),
                                                        value: profileController.contactController,
                                                     onValueChanged: (newValue) {
                                                       profileController.contactController = newValue;
                                                     },
                                                    ),
                                                    // child: Text(
                                                    //   " 1234567890",
                                                    //   style: AppTextStyle.regular300
                                                    //       .copyWith(fontSize: 10),
                                                    // )
                                                ),
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
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 14),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              updateData(
                                                widget: Text(
                                                  profileController.eduUni1Controller,
                                                  style: AppTextStyle.bold.copyWith(color: AppColors.blackColor, fontSize: 13),

                                                ),
                                                value: profileController.eduUni1Controller,
                                                onValueChanged: (newValue) {
                                                  profileController.eduUni1Controller = newValue;
                                                },
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  updateData(
                                                    widget: Text(
                                                      profileController.eduYEar1Controller,
                                                      style: AppTextStyle.regular300.copyWith(fontSize: 10),

                                                    ),
                                                    value: profileController.eduYEar1Controller,
                                                    onValueChanged: (newValue) {
                                                      profileController.eduYEar1Controller = newValue;
                                                    },
                                                  ),
                                                  updateData(
                                                    widget: Text(
                                                      profileController.eduType1Controller,
                                                      style: AppTextStyle.regular300.copyWith(fontSize: 10),

                                                    ),
                                                    value:  profileController.eduType1Controller,
                                                    onValueChanged: (newValue) {
                                                      profileController.eduType1Controller = newValue;
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        // educationDetails(
                                        //   year: profileController.eduYEar1Controller,
                                        //   field: profileController.eduType1Controller,
                                        //   uni: profileController.eduUni1Controller,
                                        // ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 14),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              updateData(
                                                widget: Text(
                                                  profileController.eduUni2Controller,
                                                  style: AppTextStyle.bold.copyWith(color: AppColors.blackColor, fontSize: 13),

                                                ),
                                                value: profileController.eduUni2Controller,
                                                onValueChanged: (newValue) {
                                                  profileController.eduUni2Controller = newValue;
                                                },
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  updateData(
                                                    widget: Text(
                                                      profileController.eduYEar2Controller,
                                                      style: AppTextStyle.regular300.copyWith(fontSize: 10),

                                                    ),
                                                    value: profileController.eduYEar2Controller,
                                                    onValueChanged: (newValue) {
                                                      profileController.eduYEar2Controller = newValue;
                                                    },
                                                  ),
                                                  updateData(
                                                    widget: Text(
                                                      profileController.eduType2Controller,
                                                      style: AppTextStyle.regular300.copyWith(fontSize: 10),

                                                    ),
                                                    value:  profileController.eduType2Controller,
                                                    onValueChanged: (newValue) {
                                                      profileController.eduType2Controller = newValue;
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),

                                        // educationDetails(
                                        //   year: profileController.eduYEar3Controller,
                                        //   field: profileController.eduType3Controller,
                                        //   uni: profileController.eduUni3Controller,
                                        // ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 14),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              updateData(
                                                widget: Text(
                                                  profileController.eduUni3Controller,
                                                  style: AppTextStyle.bold.copyWith(color: AppColors.blackColor, fontSize: 13),

                                                ),
                                                value: profileController.eduUni3Controller,
                                                onValueChanged: (newValue) {
                                                  profileController.eduUni3Controller = newValue;
                                                },
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  updateData(
                                                    widget: Text(
                                                      profileController.eduYEar3Controller,
                                                      style: AppTextStyle.regular300.copyWith(fontSize: 10),

                                                    ),
                                                    value: profileController.eduYEar3Controller,
                                                    onValueChanged: (newValue) {
                                                      profileController.eduYEar3Controller = newValue;
                                                    },
                                                  ),
                                                  updateData(
                                                    widget: Text(
                                                      profileController.eduType3Controller,
                                                      style: AppTextStyle.regular300.copyWith(fontSize: 10),

                                                    ),
                                                    value:  profileController.eduType3Controller,
                                                    onValueChanged: (newValue) {
                                                      profileController.eduType3Controller = newValue;
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        Text("PERSONAL SKILLS",style: AppTextStyle.regular600.copyWith(fontSize: 12,color: Colors.blue),),
                                        const SizedBox(height: 13),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 14),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              updateData(
                                                widget: Text(
                                                  profileController.skillTitle1Controller,
                                                  style: AppTextStyle.bold.copyWith(color: AppColors.blackColor, fontSize: 13),
                                                ),
                                                value: profileController.skillTitle1Controller,
                                                onValueChanged: (newValue) {
                                                  // profileController.titleController = newValue;
                                                  profileController.skillTitle1Controller = newValue;
                                                },
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  updateData(
                                                    widget: Text(
                                                      profileController.skillValue1Controller,
                                                      style: AppTextStyle.regular300.copyWith(fontSize: 10),
                                                    ),
                                                    value: profileController.skillValue1Controller,
                                                    onValueChanged: (newValue) {
                                                      // profileController.titleController = newValue;
                                                      profileController.skillValue1Controller = newValue;
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),

                                        const SizedBox(height: 13),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 14),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              updateData(
                                                widget: Text(
                                                  profileController.skillTitle2Controller,
                                                  style: AppTextStyle.bold.copyWith(color: AppColors.blackColor, fontSize: 13),
                                                ),
                                                value: profileController.skillTitle2Controller,
                                                onValueChanged: (newValue) {
                                                  profileController.skillTitle2Controller = newValue;
                                                },
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  updateData(
                                                    widget: Text(
                                                      profileController.skillValue2Controller,
                                                      style: AppTextStyle.regular300.copyWith(fontSize: 10),
                                                    ),
                                                    value: profileController.skillValue2Controller,
                                                    onValueChanged: (newValue) {
                                                      profileController.skillValue2Controller = newValue;
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 13),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 14),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              updateData(
                                                widget: Text(
                                                  profileController.skillTitle3Controller,
                                                  style: AppTextStyle.bold.copyWith(color: AppColors.blackColor, fontSize: 13),
                                                ),
                                                value: profileController.skillTitle3Controller,
                                                onValueChanged: (newValue) {
                                                  // profileController.titleController = newValue;
                                                  profileController.skillTitle3Controller = newValue;
                                                },
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  updateData(
                                                    widget: Text(
                                                      profileController.skillValue3Controller,
                                                      style: AppTextStyle.regular300.copyWith(fontSize: 10),
                                                    ),
                                                    value: profileController.skillValue3Controller,
                                                    onValueChanged: (newValue) {
                                                      // profileController.titleController = newValue;
                                                      profileController.skillValue3Controller = newValue;
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        // skillsDetails(
                                        //   skill: profileController.skillTitle3Controller,
                                        //   rate: profileController.skillValue3Controller,
                                        // )

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
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Padding educationDetails({String? uni,String? year, String? field}) {
    return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        updateData(
                                            widget: Text(
                                              uni!,
                                              style: AppTextStyle.bold.copyWith(color: AppColors.blackColor, fontSize: 13),

                                            ),
                                            value: uni,
                                          onValueChanged: (newValue) {
                                            // profileController.titleController = newValue;
                                            uni = newValue;
                                          },
                                        ),
                                        // Text(
                                        //   "BMU",
                                        //   style: AppTextStyle.bold.copyWith(color: AppColors.blackColor, fontSize: 13),
                                        // ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            updateData(
                                                widget: Text(
                                                  year!,
                                                  style: AppTextStyle.regular300.copyWith(fontSize: 10),

                                                ),
                                                value: year,
                                              onValueChanged: (newValue) {
                                                // profileController.titleController = newValue;
                                                year = newValue;
                                              },
                                            ),
                                            // Text(
                                            //   "2010",
                                            //   style: AppTextStyle.regular300.copyWith(fontSize: 10),
                                            // ),
                                            // Text(
                                            //   "BCA",
                                            //   style: AppTextStyle.regular300.copyWith(fontSize: 10),
                                            // ),
                                            updateData(
                                                widget: Text(
                                                  field!,
                                                  style: AppTextStyle.regular300.copyWith(fontSize: 10),

                                                ),
                                                value: field,
                                              onValueChanged: (newValue) {
                                                // profileController.titleController = newValue;
                                                field = newValue;
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
  }

  Future<void> saveImage() async {
    Uint8List? imageBytes = await captureWidget();
    if (imageBytes != null) {
      String directory = (await getApplicationDocumentsDirectory()).path;
      String filePath = '$directory/captured_image.png';

      // Save the image to the device
      await File(filePath).writeAsBytes(imageBytes);

      // Show a confirmation dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Image Saved'),
          content: Text('The image has been saved to $filePath.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<Uint8List?> captureWidget() async {
    try {

      RenderRepaintBoundary boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      log("Error capturing widget: $e");
      return null;
    }
  }


  Future<void> shareImage() async {
    Uint8List? imageBytes = await captureWidget();
    log("imageBytes    $imageBytes");
    if (imageBytes != null) {
      // Save the image to a temporary file
      String directory = (await getTemporaryDirectory()).path;
      String tempFilePath = '$directory/captured_image_temp.png';
      await File(tempFilePath).writeAsBytes(imageBytes);

      // Share the image using share_plus
      await Share.shareFiles([tempFilePath], text: 'Check out this captured image!');
    }
  }


setInitialData(){

   profileController.titleController = "DHRUVIN SAVALIYA";
   profileController.positionController  = "FLUTTER DEVELOPER";
   profileController.emailController  = "dhruvinwork25@gmail.com";
   profileController.contactController  = "1234567890";


  profileController.personDetsController  = loremIpsum;

  profileController.workExpTitle1Controller  = "Flutter Developer";
  profileController.workExpYear1Controller  = "2020-21";
  profileController.workExpDetails1Controller  = loremIpsum;

  profileController.workExpTitle2Controller  =  "Flutter Developer";
  profileController.workExpYear2Controller  = "2020-21";
  profileController.workExpDetails2Controller  = loremIpsum;

  profileController.eduUni1Controller  = "BMU";
  profileController.eduYEar1Controller  = "2010";
  profileController.eduType1Controller  = "BCA";

   profileController.eduUni2Controller  = "BMU";
   profileController.eduYEar2Controller  = "2010";
   profileController.eduType2Controller  = "BCA";

   profileController.eduUni3Controller  = "BMU";
   profileController.eduYEar3Controller  = "2010";
   profileController.eduType3Controller  = "BCA";


  profileController.skillTitle1Controller  = "Public Speaking";
  profileController.skillValue1Controller  = "4.5/5";

  profileController.skillTitle2Controller  = "Public Speaking";
  profileController.skillValue2Controller  = "4.5/5";

  profileController.skillTitle3Controller  = "Public Speaking";
  profileController.skillValue3Controller  = "4.5/5";

setState(() {

});
  }

updateData({Widget? widget,String? value,
  Function(String)? onValueChanged,
}){
    final controller = TextEditingController();
    controller.text = value!;
 return InkWell(
   onTap: () {
    showModalBottomSheet(context: context, builder: (context) {
      return SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonTextField(
                  bottomPadding: 10,
                  topPadding: 10,
                  controller: controller,
                  onChange: (p0) {
                    controller.text = p0!;
                    setState((){});
                    return null;
                  },
                ),
                ElevatedButton(onPressed: (){
                  onValueChanged?.call(controller.text);

                  log("profileController.titleController   ${profileController.titleController}");
                  Get.back();
                  setState((){  });
                }, child: const Text("Save Changes")),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      );
    },);
   },
   child: widget,
 );

}

Future<void> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    setState(() {
      selectedImage = File(image.path);
    });
  }
}
}
