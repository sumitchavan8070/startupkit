import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:startupkit/data/const.dart';
import 'package:startupkit/general_widgets/primary_button.dart';
import 'package:startupkit/pages/RegistrationScreen/resetpassword_screen.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/backcircle_arrowbutton.dart';
import 'package:startupkit/pages/RegistrationScreen/widgets/forgotpasswordcard.dart';
import 'package:startupkit/utils/colors.dart';
import 'package:startupkit/utils/icons_path.dart';
import 'package:startupkit/utils/typography.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  TextEditingController emailC = TextEditingController();
  final AppTextStyle appTextStyle = AppTextStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: registerOverlay,
        backgroundColor: Colors.transparent,
        leading: const BackCircleArrowButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 12),
        child: SizedBox(
          width: 327,
          child: Column(children: [
            ForgotPasswordCard(appTextStyle: appTextStyle),
            const SizedBox(
              height: 36,
            ),
            Container(
              width: 335,
              height: 92,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20)
                  .copyWith(left: 16, bottom: 8),
              decoration: BoxDecoration(
                  color: AppColor.kBackground, borderRadius: BorderRadius.circular(56)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: SvgPicture.asset(AppIcons.kEmail),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: appTextStyle.kBSmallMedium.copyWith(
                          color: AppColor.kGrayscale40, fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                    TextFormField(
                      style: appTextStyle.kBMediumMedium.copyWith(
                          color: AppColor.kGrayscaleDark100,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'sdchavan8070@gmail.com',
                        hintStyle: appTextStyle.kBMediumMedium.copyWith(
                          color: AppColor.kGrayscaleDark100,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            PrimaryButton(
              elevation: 0,
              onTap: () {
                Get.to(() => const ResetPasswordScreen());
              },
              text: 'Continue',
              bgColor: AppColor.kPrimary,
              borderRadius: 20,
              height: 46,
              width: 327,
              textColor: AppColor.kWhite,
            ),
          ]),
        ),
      ),
    );
  }
}
