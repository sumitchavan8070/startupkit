import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupkit/general_widgets/primary_button.dart';
import 'package:startupkit/pages/RegistrationScreen/signin_screen.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kOnBoardingColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset(
            "assets/lottie/Animation - 1736510221268.json",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            animate: true,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Text(
                  "Can be accessed from anywhere at any time",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Text(
                    "The essential language learning tools and resources you need to seamlessly transition into mastering a new language",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 23, bottom: 36),
            child: PrimaryButton(
              elevation: 0,
              onTap: () {
                // Navigate to SignInScreen when clicked
                Get.off(() => SignInScreen());
              },
              text: 'Get Started',
              // No condition needed as we only show the first item
              bgColor: AppColor.kPrimary,
              borderRadius: 20,
              height: 46,
              width: 327,
              textColor: AppColor.kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
