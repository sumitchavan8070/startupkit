import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startupkit/data/const.dart';
import 'package:startupkit/general_widgets/passwordtextfield.dart';
import 'package:startupkit/general_widgets/primary_button.dart';
import 'package:startupkit/general_widgets/primarytextbutton.dart';
import 'package:startupkit/general_widgets/primarytextfield.dart';
import 'package:startupkit/general_widgets/secondarybutton.dart';
import 'package:startupkit/pages/RegistrationScreen/forgotpassword_screen.dart';
import 'package:startupkit/pages/RegistrationScreen/signup_screen.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/custom_richtext.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/divderrow.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/tremsandprivacytext.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/welcomebackcard.dart';
import 'package:startupkit/pages/landingScreen/landing_screen.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/images_path.dart';
import 'package:startupkit/utils/typography.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailC = TextEditingController();

  final TextEditingController passwordC = TextEditingController();
   AppTextStyle? appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        systemOverlayStyle: registerOverlay,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
            SizedBox(
            width: 248.w,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi, Welcome Back! 👋',
                    textAlign: TextAlign.center,
                    style: appTextStyle?.kH5SemiBoldTextstyle.copyWith(
                        color: AppColor.kGrayscaleDark100, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'We happy to see you. Sign In to your account',
                    textAlign: TextAlign.center,
                    style: appTextStyle?.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscale40, fontSize: 14.sp),
                  )
                ]),
          ),
              const SizedBox(height: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  PrimaryTextFormField(
                    borderRadius: BorderRadius.circular(24),
                    hintText: 'sdchavan8070@gmail.com',
                    controller: emailC,
                    width: double.infinity,
                    height: 52,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  PasswordTextField(
                    borderRadius: BorderRadius.circular(24),
                    hintText: 'Password',
                    controller: passwordC,
                    width: double.infinity,
                    height: 52,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryTextButton(
                    onPressed: () {
                      Get.to(() => ForgotPasswordScreen());
                    },
                    title: 'Forgot Password?',
                    textStyle: TextStyle(
                      color: AppColor.kPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  PrimaryButton(
                    elevation: 0,
                    onTap: () {
                      Get.off(() => const LandingScreen());
                    },
                    text: 'LogIn',
                    bgColor: AppColor.kPrimary,
                    borderRadius: 20,
                    height: 46,
                    width: double.infinity,
                    textColor: AppColor.kWhite,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 24),
                  CustomRichText(
                    title: 'Don’t have an account?',
                    subtitle: ' Create here',
                    onTab: () {
                      Get.off(() => SignUpScreen());
                    },
                    subtitleTextStyle: TextStyle(
                      color: AppColor.kPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Column(
                  children: [
                    DividerRow(title: 'Or Sign In with'),
                    const SizedBox(height: 24),
                    SecondaryButton(
                      height: 56,
                      textColor: AppColor.kGrayscaleDark100,
                      width: double.infinity,
                      onTap: () {},
                      borderRadius: 24,
                      bgColor: AppColor.kBackground.withOpacity(0.3),
                      text: 'Continue with Google',
                      icons: ImagesPath.kGoogleIcon,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TermsAndPrivacyText(
                  title1: '  By signing up you agree to our',
                  title2: ' Terms ',
                  title3: '  and',
                  title4: ' Conditions of Use',
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
