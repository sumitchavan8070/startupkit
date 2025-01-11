import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:startupkit/general_widgets/Dialogs/sharedialog.dart';
import 'package:startupkit/general_widgets/primary_button.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/icons_path.dart';
import 'package:startupkit/utils/images_path.dart';
import 'package:startupkit/utils/typography.dart';

class IncorrectDialog extends StatelessWidget {
  const IncorrectDialog(
      {super.key, required this.appTextStyle, required this.correctAnswer});

  final AppTextStyle appTextStyle;

  final String correctAnswer;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: AppColor.kWhite,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32.h,
              ),
              Center(
                child: SizedBox(
                    width: 70.w,
                    height: 70.w,
                    child: Image.asset(ImagesPath.kCancel)),
              ),
              SizedBox(
                height: 24.h,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset(AppIcons.kCancelIcon),
                title: Text(
                  'Incorrect',
                  style: appTextStyle.kBLargeSemiBold
                      .copyWith(color: AppColor.kGrayscaleDark100),
                ),
                trailing: InkWell(
                  onTap: () {
                    Get.dialog(
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: ShareDialog(
                          onTap: () {
                            Get.close(2);
                          },
                        ),
                      ),
                    );
                  },
                  child: SvgPicture.asset(AppIcons.kSendIcon),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Correct',
                style: appTextStyle.kBMediumMedium
                    .copyWith(color: AppColor.kGrayscaleDark100),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: 263.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColor.kLine.withOpacity(0.1),
                    border: Border.all(color: AppColor.kLine)),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                child: Text(
                  correctAnswer,
                  style: appTextStyle.kBMediumMedium
                      .copyWith(color: AppColor.kGrayscaleDark100),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              PrimaryButton(
                elevation: 0,
                onTap: () {
                  Get.back<void>();
                },
                text: 'Continue',
                bgColor: AppColor.kPrimary,
                borderRadius: 20.r,
                height: 46.h,
                textColor: AppColor.kWhite,
                width: 263.w,
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}