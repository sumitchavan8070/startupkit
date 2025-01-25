// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupkit/data/const.dart';
import 'package:startupkit/general_widgets/passwordtextfield.dart';
import 'package:startupkit/general_widgets/primary_button.dart';
import 'package:startupkit/general_widgets/primarytextfield.dart';
import 'package:startupkit/general_widgets/secondarybutton.dart';
import 'package:startupkit/pages/RegistrationScreen/enablelocation_screen.dart';
import 'package:startupkit/pages/RegistrationScreen/signin_screen.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/createaccountcard.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/custom_richtext.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/divderrow.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/nameinputfields.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/tremsandprivacytext.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/images_path.dart';
import 'package:startupkit/utils/typography.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstName = TextEditingController();

  final TextEditingController lastName = TextEditingController();

  final TextEditingController emailC = TextEditingController();

  final TextEditingController passwordC = TextEditingController();
  final AppTextStyle appTextStyle = AppTextStyle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        systemOverlayStyle: registerOverlay,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              CreateAccountCard(appTextStyle: appTextStyle,),
              NameInputFields(firstName: firstName,  appTextStyle: appTextStyle, listName: lastName,),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 7),
                  PrimaryTextFormField(
                    borderRadius: BorderRadius.circular(24),
                    hintText: 'sdchavan8070@gmail.com',
                    controller: emailC,
                    width: double.infinity,
                    height: 52,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.w600,
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
              const SizedBox(height: 28),
              Column(
                children: [
                  PrimaryButton(
                    elevation: 0,
                    onTap: () {
                      Get.to(() => const EnableLocationScreen());
                    },
                    text: 'Create Account',
                    bgColor: AppColor.kPrimary,
                    borderRadius: 20,
                    height: 46,
                    width: double.infinity,
                    textColor: AppColor.kWhite,
                  ),
                  const SizedBox(height: 20),
                  CustomRichText(
                    title: 'Already have an account? ',
                    subtitle: 'Log In',
                    onTab: () {
                      Get.off(() => SignInScreen());
                    },
                    subtitleTextStyle: theme.textTheme.bodyMedium!.copyWith(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: DividerRow(title: 'Or Sign Up with'),
                    ),
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
              const SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TermsAndPrivacyText(
                  title1: '  By signing up you agree to our',
                  title2: ' Terms ',
                  title3: '  and',
                  title4: ' Conditions of Use',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
