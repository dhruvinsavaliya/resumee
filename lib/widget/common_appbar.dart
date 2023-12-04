import 'package:flutter/material.dart';
import 'package:resumee/config/app_colors.dart';
import 'package:resumee/config/text_style.dart';

commonAppBar({
  String? title,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  IconData? leftIcon,
  IconData? rightIcon,
  String? leftImage,
  TextEditingController? textFieldController,
  String? rightImage,
  EdgeInsetsGeometry? rightPadding,
  EdgeInsetsGeometry? leftPadding,
  double? rightIconSize,
  double? leftIconSize,
  Function()? leftOnTap,
  Function()? rightOnTap,
}) {
  return Container(
    padding: padding ?? const EdgeInsets.fromLTRB(24, 42, 24, 24),
    margin: margin,
    color: AppColors.primary,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            (leftImage == null && leftIcon == null)
                ? const SizedBox(
                    width: 16,
                  )
                : InkWell(
                    onTap: leftOnTap,
                    child: Container(
                      height: 30,
                      padding: leftPadding ?? const EdgeInsets.all(8),
                      width: 10,
                      child: leftIcon != null
                          ? Icon(
                              leftIcon,
                              size: leftIconSize ?? 18,
                        color: AppColors.whiteColor,
                      )
                          : Image.asset(
                              "$leftImage",
                              width: leftIconSize ?? 19,
                            ),
                    )),
            // SizedBox(
            //   width: Get.width * 0.27,
            // ),
            Expanded(
              child: Center(
                child: Text(
                  "$title",
                  style: AppTextStyle.regular700
                      .copyWith(fontSize: 20, color: AppColors.whiteColor),
                ),
              ),
            ),
            (rightImage == null && rightIcon == null)
                ? const SizedBox(
                    width: 28,
                  )
                : InkWell(
                    onTap: rightOnTap,
                    child: Container(
                      // color: AppColors.black50,
                      height: 30,
                      padding: rightPadding ?? const EdgeInsets.all(6),
                      width: 40,
                      child: rightIcon != null
                          ? Icon(
                              rightIcon,
                              size: rightIconSize ?? 18,
                        color: AppColors.whiteColor,
                            )
                          : Image.asset(
                              "$rightImage",
                              width: rightIconSize ?? 22,
                            ),
                    )),
          ],
        ),
      ],
    ),
  );
}
