import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startupkit/data/const.dart';
import 'package:startupkit/general_widgets/passwordtextfield.dart';
import 'package:startupkit/general_widgets/primary_button.dart';
import 'package:startupkit/pages/RegistrationScreen/verifycode_screen.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/backcircle_arrowbutton.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/start_up_kit_app_bar.dart';
import 'package:startupkit/utils/typography.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmC = TextEditingController();
  final AppTextStyle appTextStyle = AppTextStyle();

  @override
  void dispose() {
    passwordC.dispose();
    confirmC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      appBar: StartUpKitAppBar(
            title: 'Reset Password',
            showAction: false,
            backgroundColor: Colors.transparent,
            titleColor: AppColor.kGrayscaleDark100,
          ) ??
          AppBar(
            elevation: 0,
            systemOverlayStyle: registerOverlay,
            backgroundColor: Colors.transparent,
            leading: const BackCircleArrowButton(),
          ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          width: 327.w,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ).copyWith(top: 12.h),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Your password must be at least 8 characters long and include a combination of letters, numbers',
                  textAlign: TextAlign.center,
                  style: appTextStyle.kBMediumMedium.copyWith(
                      color: AppColor.kGrayscale40, fontWeight: FontWeight.w500, fontSize: 14.sp),
                )
              ]),
            ),
            SizedBox(
              height: 36.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Password',
                  style: appTextStyle.kBMediumMedium.copyWith(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                PasswordTextField(
                    borderRadius: BorderRadius.circular(24.r),
                    hintText: '••••••••••••••',
                    controller: passwordC,
                    width: 327.w,
                    height: 52.h)
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Confirm New Password',
                  style: appTextStyle.kBMediumMedium.copyWith(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                PasswordTextField(
                    borderRadius: BorderRadius.circular(24.r),
                    hintText: '••••••••••••••',
                    controller: confirmC,
                    width: 327.w,
                    height: 52.h)
              ],
            ),
            SizedBox(
              height: 48.h,
            ),
            PrimaryButton(
              elevation: 0,
              onTap: () {
                Get.off(() =>
                    VerifyCodeScreen()); // Get.dialog(SuccessDialog(appTextStyle: appTextStyle));
              },
              text: 'Submit',
              bgColor: AppColor.kPrimary,
              borderRadius: 20.r,
              height: 46.h,
              width: 327.w,
              textColor: AppColor.kWhite,
            ),
          ]),
        ),
      ),
    );
  }
}
