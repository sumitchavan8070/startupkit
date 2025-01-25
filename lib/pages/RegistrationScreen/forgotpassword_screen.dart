import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:startupkit/data/const.dart';
import 'package:startupkit/general_widgets/primary_button.dart';
import 'package:startupkit/pages/RegistrationScreen/resetpassword_screen.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/backcircle_arrowbutton.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/icons_path.dart';
import 'package:startupkit/utils/start_up_kit_app_bar.dart';
import 'package:startupkit/utils/typography.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final AppTextStyle appTextStyle = AppTextStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: StartUpKitAppBar(
            title: 'Forgot Password',
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
        padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 12),
        child: SizedBox(
          width: 327.w,
          child: Column(
            children: [
              _buildInstructionText(),
              const SizedBox(height: 36),
              _buildEmailInputField(),
              const SizedBox(height: 48),
              _buildContinueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w).copyWith(bottom: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8.h),
          Text(
            'Enter your email, we will send a verification code to your email.',
            textAlign: TextAlign.center,
            style: appTextStyle.kBMediumMedium.copyWith(
              color: AppColor.kGrayscale40,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailInputField() {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 16, horizontal: 20).copyWith(left: 16, bottom: 8),
      decoration: BoxDecoration(
        color: AppColor.kBackground,
        borderRadius: BorderRadius.circular(56),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: SvgPicture.asset(AppIcons.kEmail),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: appTextStyle.kBSmallMedium.copyWith(
                color: AppColor.kGrayscale40,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            TextFormField(
              controller: emailController,
              style: appTextStyle.kBMediumMedium.copyWith(
                color: AppColor.kGrayscaleDark100,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: 'your.email@example.com',
                hintStyle: appTextStyle.kBMediumMedium.copyWith(
                  color: AppColor.kGrayscaleDark100,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return PrimaryButton(
      elevation: 0,
      onTap: () {
        Get.to(() => const ResetPasswordScreen());
      },
      text: 'Continue',
      bgColor: AppColor.kPrimary,
      borderRadius: 20,
      height: 46.h,
      width: 327.w,
      textColor: AppColor.kWhite,
    );
  }
}
