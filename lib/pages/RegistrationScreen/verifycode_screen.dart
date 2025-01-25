import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startupkit/data/const.dart';
import 'package:startupkit/general_widgets/Dialogs/termsandconditions_dialog.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/backcircle_arrowbutton.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/countdown_widget.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/custom_richtext.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/start_up_kit_app_bar.dart';
import 'package:startupkit/utils/typography.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:startupkit/general_widgets/primary_button.dart'; // Import PrimaryButton widget

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  TextEditingController pinController = TextEditingController();

  final AppTextStyle appTextStyle = AppTextStyle();

  // Function to validate OTP
  void _validateOTP() {
    if (pinController.text.length == 4) {
      // OTP validation logic here
      Get.dialog(
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: TermsAndConditionsDialog(appTextStyle: appTextStyle),
        ),
      );
    } else {
      // Show error message if OTP is incomplete
      Get.snackbar("Error", "Please enter the complete 4-digit code");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: StartUpKitAppBar(
        title: 'Verify Code',
        showAction: false,
        backgroundColor: Colors.transparent,
        titleColor: AppColor.kGrayscaleDark100,
      ) ?? AppBar(
        elevation: 0,
        systemOverlayStyle: registerOverlay,
        backgroundColor: Colors.transparent,
        leading: const BackCircleArrowButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          width: 330.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 40),
              CustomRichText(
                title: 'Please enter the code we just sent to',
                subtitle: 'jaydonfranci@email.com',
                onTab: () {},
                subtitleTextStyle: appTextStyle.kBMediumMedium.copyWith(
                  color: AppColor.kGrayscaleDark100,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 44.h), // Provide some space between elements
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: PinCodeTextField(
                  controller: pinController,
                  enablePinAutofill: true,
                  obscureText: false,
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  hintStyle: appTextStyle.kH4MediumTextstyle.copyWith(
                    color: AppColor.kGrayscaleDark100,
                  ),
                  textStyle: appTextStyle.kH4MediumTextstyle.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontSize: 14.sp,
                  ),
                  pinTheme: PinTheme(
                    inactiveColor: AppColor.kBackground,
                    fieldHeight: 56.h,
                    fieldWidth: 56.w,
                    disabledColor: AppColor.kBackground,
                    errorBorderColor: AppColor.kBackground,
                    selectedColor: AppColor.appBg,
                    activeColor: AppColor.kBackground,
                    inactiveFillColor: AppColor.kBackground,
                    selectedFillColor: AppColor.kBackground,
                    activeFillColor: AppColor.kBackground,
                    shape: PinCodeFieldShape.circle,
                  ),
                  length: 4,
                  onChanged: (String value) {},
                  appContext: context,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  onCompleted: (val) {
                    if (val.length >= 4) {
                      _validateOTP();
                    }
                  },
                ),
              ),
              const Spacer(), // Push the countdown widget to the bottom
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 24.h),
                child: const Countdown(),
              ),
              SizedBox(height: 32.h), // Add space before the button
              PrimaryButton(
                text: 'Validate OTP',
                bgColor: AppColor.kPrimary,
                borderRadius: 20,
                height: 46.h,
                width: 327.w,
                textColor: AppColor.kWhite,
                onTap: _validateOTP, // Button action
              ),
            ],
          ),
        ),
      ),
    );
  }
}
